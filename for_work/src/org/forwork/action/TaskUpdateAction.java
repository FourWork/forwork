package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.ScrumBoardService;

public class TaskUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward af = new ActionForward();
		ScrumBoardService service = ScrumBoardService.getInstance();
		
		af.setPath("");
		af.setRedirect(true);
		return af;
	}

}
