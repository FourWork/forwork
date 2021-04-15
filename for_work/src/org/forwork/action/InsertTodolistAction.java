package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Todolist;
import org.forwork.service.TodolistService;


public class InsertTodolistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		ActionForward forward = new ActionForward();
		TodolistService service = TodolistService.getInstance();

		int member_id = Integer.parseInt(request.getParameter("member_id"));

		Todolist todolist = new Todolist();
		todolist.setMember_id(member_id);
		todolist.setTodolist_content(request.getParameter("todolist_content"));

		service.insertTodolistService(todolist);

		forward.setRedirect(true);
		forward.setPath("allTodolistAction.do?member_id=" + member_id);

		return forward;
	}

}
