package org.forwork.domain;

import java.io.Serializable;

public class Todolist implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int todolist_id;
	private int member_id;
	private String todolist_content;
	private String todolist_check;
	
	public Todolist() {
		
	}

	public Todolist(int todolist_id, int member_id, String todolist_content, String todolist_check) {
		super();
		this.todolist_id = todolist_id;
		this.member_id = member_id;
		this.todolist_content = todolist_content;
		this.todolist_check = todolist_check;
	}

	public int getTodolist_id() {
		return todolist_id;
	}

	public void setTodolist_id(int todolist_id) {
		this.todolist_id = todolist_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getTodolist_content() {
		return todolist_content;
	}

	public void setTodolist_content(String todolist_content) {
		this.todolist_content = todolist_content;
	}

	public String getTodolist_check() {
		return todolist_check;
	}

	public void setTodolist_check(String todolist_check) {
		this.todolist_check = todolist_check;
	}
	
}
