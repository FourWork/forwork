package org.forwork.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberDto implements Serializable {
	private String member_id;
	private String name;
	private String email;
	private String status;
}
