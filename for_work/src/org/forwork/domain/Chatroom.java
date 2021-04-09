package org.forwork.domain;

public class Chatroom {
	private String chatroom_id;
	private String chatroom_name;
	
	public Chatroom() {}

	public Chatroom(String chatroom_id, String chatroom_name) {
		super();
		this.chatroom_id = chatroom_id;
		this.chatroom_name = chatroom_name;
	}

	public String getChatroom_id() {
		return chatroom_id;
	}

	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}

	public String getChatroom_name() {
		return chatroom_name;
	}

	public void setChatroom_name(String chatroom_name) {
		this.chatroom_name = chatroom_name;
	}
	
}
