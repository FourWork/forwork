package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Todolist;
import org.forwork.service.TodolistService;


public class AllTodolistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		TodolistService service = TodolistService.getInstance();
		
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		
		List<Todolist> doing = service.selectDoinglistService(member_id);
		List<Todolist> done = service.selectDonelistService(member_id);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("doing", doing);
		request.setAttribute("done", done);
		
		forward.setRedirect(false);
		forward.setPath("/views/mainTodolist.jsp");
//		forward.setPath("/views/a.jsp");
		
		return forward;
	}

}
