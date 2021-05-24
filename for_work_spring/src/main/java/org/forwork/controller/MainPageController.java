package org.forwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.forwork.service.board.PostService;
import org.forwork.service.todolist.TodolistService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class MainPageController {
	
	private PostService postService;
	private TodolistService todolistService;

	@GetMapping("/main")
	public void main(int project_id, int member_id, Model model) {
		log.info("forwork main page");
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("project_id", project_id);
		
		model.addAttribute("notice", postService.getNotice(project_id)); // 怨듭� �궗�빆
		model.addAttribute("doing", todolistService.doingList(member_id)); // �빐�빞 �븷 �씪 紐⑸줉
		model.addAttribute("done", todolistService.doneList(member_id)); // �셿猷뚮맂 �븷 �씪 紐⑸줉
		
	}
}
