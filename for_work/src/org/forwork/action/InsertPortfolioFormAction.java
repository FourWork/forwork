package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertPortfolioFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/views/MyProfile/test_myProfile_add.jsp");
		
		return forward;
	}

}
