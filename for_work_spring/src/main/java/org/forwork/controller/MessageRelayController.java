package org.forwork.controller;

import org.forwork.domain.Message;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class MessageRelayController {
	
	// 각 사용자들은 자기가 속한 채팅방을 구독 (/topic/chatroom/{id})
	// 메세지 종류 : 채팅방 입장,퇴장 메세 / 채팅 메세지

    @MessageMapping("/message/{chatroomId}")
    @SendTo("/topic/chatroom/{chatroomId}")
    public Message sendUsualMessage(@DestinationVariable String chatroomId, Message message) throws Exception {
        System.out.println(message);
        return message;
    }
    
    
    
    

}