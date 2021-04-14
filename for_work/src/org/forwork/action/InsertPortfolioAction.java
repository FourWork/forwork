package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.PortfolioService;

public class InsertPortfolioAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		PortfolioService service = PortfolioService.getInstance();
		request.setCharacterEncoding("utf-8");
		
		service.insertPortfolioService(request);
		forward.setRedirect(true);
		forward.setPath("listPortfolioAction.do");
		
		
		return forward;
	}

}
