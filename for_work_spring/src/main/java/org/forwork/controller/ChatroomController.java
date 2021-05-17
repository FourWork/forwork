package org.forwork.controller;

import java.util.List;

import org.forwork.domain.Chatroom;
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

@RequestMapping("/chatroom/*")
@AllArgsConstructor
@RestController
public class ChatroomController {

	private final ChattingService service;
	
	@GetMapping(value = "/{chatroomId}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Chatroom> getChatroomName(@PathVariable String chatroomId) {
		Chatroom chatroom = new Chatroom();
		chatroom.setChatroom_name(service.findChatroomName(chatroomId));
		return new ResponseEntity<>(chatroom, HttpStatus.OK);
	}
}