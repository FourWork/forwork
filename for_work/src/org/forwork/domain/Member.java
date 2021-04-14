package org.forwork.domain;

import java.io.Serializable;

public class Member implements Serializable {
	private String member_id;
	private String email;
	private String name;
	private String pw;
	private String status_id;

	public Member() {}

	public Member(String member_id, String email, String name, String pw, String status_id, String role) {
		super();
		this.member_id = member_id;
		this.email = email;
		this.name = name;
		this.pw = pw;
		this.status_id = status_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getStatus_id() {
		return status_id;
	}

	public void setStatus_id(String status_id) {
		this.status_id = status_id;
	}

	
}


