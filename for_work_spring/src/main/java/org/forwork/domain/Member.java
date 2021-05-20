package org.forwork.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class Member implements Serializable {
	private String member_id;
	private String email;
	private String name;
	private String pw;
	private String status_id;


}
