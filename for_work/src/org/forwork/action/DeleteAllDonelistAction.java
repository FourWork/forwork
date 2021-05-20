package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.TodolistService;


public class DeleteAllDonelistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		TodolistService service = TodolistService.getInstance();
		
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		
		service.deleteAllDonelistService(member_id);
		
		forward.setRedirect(true);
		forward.setPath("allTodolistAction.do?member_id=" + member_id);
		
		return forward;
	}

}