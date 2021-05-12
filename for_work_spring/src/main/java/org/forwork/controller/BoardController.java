package org.forwork.controller;

import org.forwork.domain.Board;
import org.forwork.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/menu")
	public void menu(Model model, int project_id) {
		log.info("board menu");
		model.addAttribute("menu", service.getList(project_id));
	}
	
	@PostMapping("/register")
	public String register(Board board, RedirectAttributes rttr) {
		log.info("board register: " + board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBoard_id());
		
		return "redirect:/board/menu";
	}
	
	@PostMapping("/modify")
	public String modify(Board board, RedirectAttributes rttr) {
		log.info("board modify: " + board);
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/menu";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("board_id") Long board_id, RedirectAttributes rttr) {
		log.info("board remove: " + board_id);
		
		if (service.remove(board_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/menu";
	}
	
	@GetMapping("/main")
	public void main() {

	}
	
	
	
	
}
