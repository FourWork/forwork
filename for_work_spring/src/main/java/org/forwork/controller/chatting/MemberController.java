package org.forwork.controller.chatting;

import java.util.List;

import org.forwork.domain.Chatroom;
import org.forwork.service.chatting.ChattingService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RequestMapping("/member/*")
@AllArgsConstructor
@RestController
public class MemberController {
	
	private final ChattingService service;
	
	@GetMapping(value = "/chatroom/{chatroomId}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<String>> getChatrooms(@PathVariable String chatroomId) {
		List<String> members = service.findMemberByChatroomId(chatroomId);
		return new ResponseEntity<>(members, HttpStatus.OK);
	}
}