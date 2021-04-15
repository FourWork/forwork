package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.ScrumBoardService;


public class InsertSprintAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ScrumBoardService service = ScrumBoardService.getInstance();
		service.insertSprintService(request);
		
		forward.setRedirect(true);
		forward.setPath("scrumBoard.do");
		
		
		return forward;
	}

}
