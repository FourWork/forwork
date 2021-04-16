package org.forwork.dto;

import java.io.Serializable;

import org.forwork.domain.Member;

public class MessageDto implements Serializable {
	private String message_id;
	private String message;
	private String send_time;
	private String chatroom_id;
	private Member sender;
	
	public MessageDto() {}

	public MessageDto(String message_id, String message, String send_time, String chatroom_id, Member sender) {
		super();
		this.message_id = message_id;
		this.message = message;
		this.send_time = send_time;
		this.chatroom_id = chatroom_id;
		this.sender = sender;
	}

	public String getMessage_id() {
		return message_id;
	}

	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getChatroom_id() {
		return chatroom_id;
	}

	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}

	public Member getSender() {
		return sender;
	}

	public void setSender(Member sender) {
		this.sender = sender;
	}

	@Override
	public String toString() {
		return "Message [message_id=" + message_id + ", message=" + message + ", send_time=" + send_time
				+ ", chatroom_id=" + chatroom_id + ", sender=" + sender + "]";
	}
	
}
