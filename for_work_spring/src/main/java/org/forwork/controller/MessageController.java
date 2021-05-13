package org.forwork.controller;

import java.util.List;

import org.forwork.dto.MessageDto;
import org.forwork.service.ChattingService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RequestMapping("/message/*")
@AllArgsConstructor
@RestController
public class MessageController {

	private final ChattingService service;
	
	@GetMapping(value = "/chatroom/{chatroomId}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MessageDto>> getMessages(@PathVariable String chatroomId) {
		return new ResponseEntity<>(service.findMessageByChatroomId(chatroomId), HttpStatus.OK);
	}
	
	
	
}
