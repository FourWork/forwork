package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Todolist;


public interface TodolistMapper {

	int insertTodolist(Todolist todolist);
	List<Todolist> selectTodolist(int member_id); // 회원별 할 일 목록
	int updateDonelist(int todolist_id); // 할 일 완료
	List<Todolist> selectDoinglist(int member_id); // 해야 할 일 목록
	List<Todolist> selectDonelist(int member_id); // 완료된 할 일 목록
	int deleteTodolist(int todolist_id); // 할 일 하나 삭제
	int deleteAllDonelist(int member_id); // 완료 항목 전체 삭제
}
