package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;
import org.forwork.domain.Portfolio_Language;
import org.forwork.service.PortfolioService;


public class ListPortfolioAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	ActionForward forward = new ActionForward();
	HttpSession session = request.getSession();
	PortfolioService service = PortfolioService.getInstance();

	String member_id = null;

	if(session !=null) {
		
		 member_id = Integer.toString((int) session.getAttribute("member_id"));
		 System.out.println("멤버아이디 가져오기"+member_id);
	}
	
	List<Portfolio> list = service.listPortfolioService(member_id);
	request.setAttribute("list", list);

	Member member = service.loadMemberCard(member_id);
	request.setAttribute("member", member);
	
	List<Portfolio_Language> langList = service.listLanguageService(member_id);
	request.setAttribute("langList", langList);


	
	forward.setRedirect(false);
	forward.setPath("/views/myprofile_main.jsp");
	
	return forward;
	}

}
