package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.TodolistService;


public class UpdateDonelistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		TodolistService service = TodolistService.getInstance();
		
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		int todolist_id = Integer.parseInt(request.getParameter("todolist_id"));
		
		service.updateDonelistService(todolist_id);
		
		forward.setRedirect(true);
		forward.setPath("allTodolistAction.do?member_id=" + member_id);
		
		return forward;
	}

}
