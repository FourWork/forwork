package org.forwork.domain;

public class Chatroom {
	private String chatroom_id;
	private String chatroom_name;
	private String user_id;
	
	public Chatroom() {}

	public Chatroom(String chatroom_id, String chatroom_name, String user_id) {
		super();
		this.chatroom_id = chatroom_id;
		this.chatroom_name = chatroom_name;
		this.user_id = user_id;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
