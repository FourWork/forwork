package org.forwork.service;

import java.util.List;

import org.forwork.domain.Todolist;

public interface TodolistService {

	public int insert(Todolist todolist);
	
	public List<Todolist> memberTodolist(int member_id);
	
	public int updateDone(int todolist_id);
	
	public List<Todolist> doingList(int member_id); // 해야 할 일 목록
	
	public List<Todolist> doneList(int member_id); // 완료된 할 일 목록
	
	public int delete(int todolist_id);
	
	public int deleteAll(int member_id);
	
	public int update(Todolist todolist);
}
