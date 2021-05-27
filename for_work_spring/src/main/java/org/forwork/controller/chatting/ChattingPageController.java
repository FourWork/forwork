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
	
	@GetMapping("/chatroomDetail")
	public String detail(@ModelAttribute("chatroomId") String chatroomId) {
		return "/chatting/chatroomDetail";
	}
	
	@GetMapping("/tmpMain")
	public String main() {
		return "/chatting/tmpMain";
	}
	
	@GetMapping("/searchMember")
	public String search() {
		return "/chatting/searchMember";
	}
	
}
