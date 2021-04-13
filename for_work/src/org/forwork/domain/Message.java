package org.forwork.domain;

import java.io.Serializable;

public class Message implements Serializable {
	private String message_id;
	private String message;
	private String send_time;
	private String chatroom_id;
	private String sender;
	
	public Message() {}

	public Message(String message_id, String message, String send_time, String chatroom_id, String sender) {
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

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}
	
}
