package org.forwork.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/chatting/*", produces = MediaType.TEXT_HTML_VALUE)
public class ChattingPageController {
	
	@GetMapping("/chatroomDetail")
	public String detail(@ModelAttribute("chatroomId") String chatroomId, @ModelAttribute("userId") String userId) {
		// TODO: userId 세션에서 받아오기 
		return "/chatting/chatroomDetail";
	}
	
}
