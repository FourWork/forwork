package org.forwork.dto;

import java.util.List;

import org.forwork.domain.Chatroom;

public class ChatroomDto {
	List<Chatroom> chatrooms;
	
	public ChatroomDto() {}
	
	public ChatroomDto(List<Chatroom> chatrooms) {
		super();
		this.chatrooms = chatrooms;
	}

	public List<Chatroom> getChatrooms() {
		return chatrooms;
	}

	public void setChatrooms(List<Chatroom> chatrooms) {
		this.chatrooms = chatrooms;
	}
	
}
