package org.forwork.domain;

import java.io.Serializable;

public class Post implements Serializable {

	private int post_id;
	private int board_id;
	private String post_writer;
	private String post_title;
	private String post_content;
	private int hitcount;
	private String post_date;
	private String post_file;
	
	public Post() {
		
	}

	public Post(int post_id, int board_id, String post_writer, String post_title, String post_content,
			int hitcount, String post_date, String post_file) {
		super();
		this.post_id = post_id;
		this.board_id = board_id;
		this.post_writer = post_writer;
		this.post_title = post_title;
		this.post_content = post_content;
		this.hitcount = hitcount;
		this.post_date = post_date;
		this.post_file = post_file;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getPost_writer() {
		return post_writer;
	}

	public void setPost_writer(String post_writer) {
		this.post_writer = post_writer;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public String getPost_file() {
		return post_file;
	}

	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}
	
}
