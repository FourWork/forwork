package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertPostFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));

		request.setAttribute("project_id", project_id);
		request.setAttribute("board_id", board_id);
		
		forward.setRedirect(false);
		forward.setPath("/views/insertPost.jsp");
		
		return forward;
	}

}
