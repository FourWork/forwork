package org.forwork.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(produces = MediaType.TEXT_HTML_VALUE)
public class ChattingPageController {
	
	@GetMapping(value = "chatting/chatroom")
	public String detail() {
		return "chatting/chatroomDetail";
	}
	
	@GetMapping(value = "chatting/chatroom2")
	public String detail2() {
		return "chatting/index";
	}
}
