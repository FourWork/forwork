package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.MemberService;

public class MemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberService service = MemberService.getInstance();
		//비지니스로직 호출
		service.insertMemberService(request);
				
		//새로운 요청
		forward.setRedirect(false);
		forward.setPath("/views/login/login.jsp");
		
		return forward;
	}
	
	public ActionForward joinPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberService service = MemberService.getInstance();
		//비지니스로직 호출
		/* service.readMemberService(request); */
				
		//새로운 요청
		forward.setRedirect(false);
		forward.setPath("/views/member/join.jsp");
		
		return forward;
	}
	
	public ActionForward loginPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
				
		//새로운 요청
		forward.setRedirect(false);
		forward.setPath("/views/login/login.jsp");
		
		return forward;
	}

}