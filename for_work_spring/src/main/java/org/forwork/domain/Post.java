package org.forwork.domain;

import lombok.Data;

@Data
public class Post {

	private Long post_id;
	private Long board_id;
	private String post_writer;
	private String post_title;
	private String post_content;
	private int hitcount;
	private String post_date;
	private String post_file;
	private int commentCnt;
}
