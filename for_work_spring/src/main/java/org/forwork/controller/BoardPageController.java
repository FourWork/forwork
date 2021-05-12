package org.forwork.controller;

import org.forwork.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.forwork.service.PostService;

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
		log.info("프로젝트별 게시판 메인");
		
		boardService.init(project_id); // 새 프로젝트 공지 사항, 기본 게시판 생성
		
		model.addAttribute("menu", boardService.getList(project_id)); // 게시판 메뉴
		model.addAttribute("notice", postService.getNotice(project_id)); // 공지 사항
		model.addAttribute("board", postService.getBoard(project_id)); // 최신 글
		model.addAttribute("project_id", project_id);
	}
	
	@GetMapping("/list")
	public void list(int project_id, Long board_id, Model model) {
		log.info("게시판별 게시글 목록");
		
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("board", boardService.get(board_id)); // 게시판 이름
		model.addAttribute("list", postService.getList(board_id)); // 게시글 목록
	}

	@GetMapping("/manager")
	public void manager(int project_id, Long board_id, Model model) {
		log.info("게시판 관리");
		
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("project_id", project_id);
	}
	
	@GetMapping("/post")
	public void post(int project_id, Long board_id, Long post_id, Model model) {
		log.info("게시글 상세 보기");
		
		model.addAttribute("menu", boardService.getList(project_id));
		model.addAttribute("board", boardService.get(board_id)); 
		model.addAttribute("post", postService.get(post_id));
		postService.addHitcount(post_id); // 조회 수
	}
	
}
