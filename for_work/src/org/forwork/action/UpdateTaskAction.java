package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Task;
import org.forwork.service.ScrumBoardService;

public class UpdateTaskAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ScrumBoardService service = ScrumBoardService.getInstance();
		request.setCharacterEncoding("utf-8");
		
		Task task = new Task();
		task.setTask_id(request.getParameter("task_id"));
		task.setTask_content(request.getParameter("task_content"));
		task.setResponsibility(request.getParameter("responsibility"));
		
		service.updateTaskService(task);
		
		forward.setRedirect(true); 
		forward.setPath("scrumBoard.do");
		
		return forward;

	}

}
