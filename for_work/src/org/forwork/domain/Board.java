package org.forwork.domain;

import java.io.Serializable;

public class Board implements Serializable{

	private int board_id;
	private int project_id;
	private String board_name;
	
	public Board() {
		
	}

	public Board(int board_id, int project_id, String board_name) {
		super();
		this.board_id = board_id;
		this.project_id = project_id;
		this.board_name = board_name;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	
}
