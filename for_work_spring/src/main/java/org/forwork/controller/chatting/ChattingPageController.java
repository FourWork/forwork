package org.forwork.controller.chatting;


import org.forwork.domain.Member;
import org.forwork.service.chatting.ChattingService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/chatting/*", produces = MediaType.TEXT_HTML_VALUE)
public class ChattingPageController {
	
	private final ChattingService service;
	
	@GetMapping("/chatroomDetail")
	public String detail(@ModelAttribute("chatroomId") String chatroomId, @ModelAttribute("userId") String userId, Model model) {
		// TODO: userId 세션에서 받아오기 
		model.addAttribute("member", service.findMemberById(userId));
		return "/chatting/chatroomDetail";
	}
	
	@GetMapping("/tmpMain")
	public String main(@ModelAttribute("userId") String userId) {
		return "/chatting/tmpMain";
	}
	
	@GetMapping("/searchMember")
	public String search(@ModelAttribute("userId") String userId) {
		return "/chatting/searchMember";
	}
	
}
