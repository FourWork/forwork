package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Task;
import org.forwork.service.ScrumBoardService;

public class DetailUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ScrumBoardService service = ScrumBoardService.getInstance();
		Task task = new Task();
		
		task = service.detailTaskService(request);
		
		request.setAttribute("task", task);
		forward.setRedirect(false);
		forward.setPath("/views/taskUpdatePage.jsp");
		
		return forward;
	}

}
