package org.forwork.service;

import java.util.List;

import org.forwork.dao.TodolistDao;
import org.forwork.domain.Todolist;

public class TodolistService {

	private static TodolistService service = new TodolistService();
	private static TodolistDao dao;
	
	public static TodolistService getInstance() {
		dao = TodolistDao.getInstance();
		return service;
	}
	
	public int insertTodolistService(Todolist todolist) {
		return dao.insertTodolist(todolist);
	}
	
	public List<Todolist> selectTodolistService(int member_id) {
		return dao.selectTodolist(member_id);
	}
	
	public int updateDonelistService(int todolist_id) {
		return dao.updateDonelist(todolist_id);
	}
	
	public List<Todolist> selectDoinglistService(int member_id) {
		return dao.selectDoinglist(member_id);
	}
	
	public List<Todolist> selectDonelistService(int member_id) {
		return dao.selectDonelist(member_id);
	}
	
	public int deleteTodolistService(int todolist_id) {
		return dao.deleteTodolist(todolist_id);
	}
	
	public int deleteAllDonelistService(int member_id) {
		return dao.deleteAllDonelist(member_id);
	}
}
