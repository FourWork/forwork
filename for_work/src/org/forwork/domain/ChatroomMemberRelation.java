package org.forwork.domain;

import java.io.Serializable;

public class ChatroomMemberRelation implements Serializable {
	private String chatroom_id;
	private String member_id;
	
	public ChatroomMemberRelation() {}

	public ChatroomMemberRelation(String chatroom_id, String member_id) {
		super();
		this.chatroom_id = chatroom_id;
		this.member_id = member_id;
	}

	public String getChatroom_id() {
		return chatroom_id;
	}

	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
