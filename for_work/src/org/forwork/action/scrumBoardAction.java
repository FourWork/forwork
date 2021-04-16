package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Sprint;
import org.forwork.domain.Task;
import org.forwork.service.ScrumBoardService;



public class scrumBoardAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		ScrumBoardService service = ScrumBoardService.getInstance();
		
		List<Task> list = service.listScrumBoardService();
		request.setAttribute("list", list);
		
		List<Sprint> sprintList = service.listSprintService();
		request.setAttribute("sprintList", sprintList);
		
		
		
		forward.setRedirect(false);
		forward.setPath("/views/scrumBoard.jsp");
		
		return forward;
	}

}
