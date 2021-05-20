package org.forwork.controller.chatting;

import java.util.List;
import java.util.Map;

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

import com.google.gson.Gson;

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
		String messageId = service.createMessage(msg);
		System.out.println("create----------------------");
		System.out.println(messageId);
		
		return new ResponseEntity<String>(messageId, HttpStatus.OK);
	}
	
	@PutMapping(value = "/read/{messageId}/member/{memberId}")
	public ResponseEntity<String> checkRead(@PathVariable String messageId, @PathVariable String memberId){
		service.updateReadStatus(messageId, memberId);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PutMapping(value = "/read/member/{memberId}/chatroom/{chatroomId}")
	public ResponseEntity<String> checkReadAll(@PathVariable String memberId, @PathVariable String chatroomId){
		service.updateReadAll(chatroomId, memberId);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping(value = "/last/member/{memberId}")
	public ResponseEntity<List<Message>> getLastMessage(@PathVariable String memberId){
		return new ResponseEntity<List<Message>>(service.findLastMessagePerChatroomByMemberId(memberId), HttpStatus.OK);
	}
	
	@GetMapping(value = "/unread/member/{memberId}")
	public ResponseEntity<String> getUnreadCount(@PathVariable String memberId){
		return new ResponseEntity<>(new Gson().toJson(service.findUnreadCountPerChatroomByMemberId(memberId)), HttpStatus.OK);
	}
}
