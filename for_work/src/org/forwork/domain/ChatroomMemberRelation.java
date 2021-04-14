package org.forwork.domain;

import java.io.Serializable;

public class ChatroomMemberRelation implements Serializable {
	private String chatroom_id;
	private String user_id;
	
	public ChatroomMemberRelation() {}

	public ChatroomMemberRelation(String chatroom_id, String user_id) {
		super();
		this.chatroom_id = chatroom_id;
		this.user_id = user_id;
	}

	public String getChatroom_id() {
		return chatroom_id;
	}

	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
