package org.forwork.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.forwork.domain.Criteria;
import org.forwork.dto.PageDto;
import org.forwork.service.board.BoardService;
import org.forwork.service.board.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardPageController {

	private BoardService boardService;
	private PostService postService;
	
	@GetMapping("/main")
	public void main(int project_id, Model model) {
		log.info("?”„ë¡œì ?Š¸ë³? ê²Œì‹œ?Œ ë©”ì¸");
		
		boardService.init(project_id); // ?ƒˆ ?”„ë¡œì ?Š¸ ê³µì? ?‚¬?•­, ê¸°ë³¸ ê²Œì‹œ?Œ ?ƒ?„±
		
		model.addAttribute("menu", boardService.getList(project_id)); // ê²Œì‹œ?Œ ë©”ë‰´
		model.addAttribute("notice", postService.getNotice(project_id)); // ê³µì? ?‚¬?•­
		model.addAttribute("board", postService.getBoard(project_id)); // ìµœì‹  ê¸?
		model.addAttribute("project_id", project_id);
	}
	
	@GetMapping("/list")
	public void list(int project_id, Long board_id, Criteria cri, Model model) {
		log.info("ê²Œì‹œ?Œë³? ê²Œì‹œê¸? ëª©ë¡");
		log.info("cri: " + cri);
		
		int total = postService.getTotal(cri, board_id);
		
		if (total < 10) {
			cri.setAmount(total);
		} else {
			cri.setAmount(10);
		}
		
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("board", boardService.get(board_id)); // ê²Œì‹œ?Œ ?´ë¦?
		model.addAttribute("list", postService.getListPage(cri, board_id)); // ê²Œì‹œê¸? ëª©ë¡
		model.addAttribute("pageMaker", new PageDto(cri, total));
	}

	@GetMapping("/manager")
	public void manager(int project_id, Long board_id, Model model) {
		log.info("ê²Œì‹œ?Œ ê´?ë¦? ?˜?´ì§?");
		
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("project_id", project_id);
	}
	
	@GetMapping("/post")
	public void post(@RequestParam("project_id") int project_id, @RequestParam("board_id") Long board_id, 
			@RequestParam("post_id") Long post_id, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("ê²Œì‹œê¸? ?ƒ?„¸ ë³´ê¸°");
		postService.addHitcount(post_id); // ì¡°íšŒ ?ˆ˜
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("board", boardService.get(board_id)); 
		model.addAttribute("post", postService.get(post_id));
	}

	@GetMapping("/updatePost")
	public void updatePost(@RequestParam("project_id") int project_id, @RequestParam("board_id") Long board_id, 
			@RequestParam("post_id") Long post_id, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("ê²Œì‹œê¸? ?ˆ˜? • ?˜?´ì§?");
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("board", boardService.get(board_id)); 
		model.addAttribute("post", postService.get(post_id));
	}

	@GetMapping("/insertPost")
	public void insertPost(int project_id, Long board_id, Model model) {
		log.info("ê²Œì‹œê¸? ?“±ë¡? ?˜?´ì§?");
		
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("board", boardService.get(board_id)); 
	}
	
}
