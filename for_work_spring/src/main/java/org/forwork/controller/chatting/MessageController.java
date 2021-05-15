package org.forwork.controller.chatting;

import java.util.List;

import org.forwork.domain.Message;
import org.forwork.dto.MessageDto;
import org.forwork.service.chatting.ChattingService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public ResponseEntity<List<MessageDto>> read(@PathVariable String chatroomId) {
		return new ResponseEntity<>(service.findMessageByChatroomId(chatroomId), HttpStatus.OK);
	}
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody Message msg) {
		service.createMessage(msg);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
//	@PutMapping(value = "/read/chatroom/{chatroomId}/member/{memberId}")
//	public ResponseEntity<String> checkRead(@PathVariable String chatroomId, String memberId){
//		service.updateReadStatus(chatroomId, memberId);
//		
//		return new ResponseEntity<String>("success", HttpStatus.OK);
//	}
	
}
