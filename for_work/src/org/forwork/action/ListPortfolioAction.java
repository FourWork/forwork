package org.forwork.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
	//포폴 가져오기
	List<Portfolio> list = service.listPortfolioService(member_id);
	request.setAttribute("list", list);
	//포폴당 언어 가져오기
	List<Portfolio_Language> langList = service.listLanguageService(member_id);
	request.setAttribute("langList", langList);
	//회원정보 가져오기
	Member member = service.loadMemberCard(member_id);
	request.setAttribute("member", member);
	
//	//포폴언어 통계를 위한 언어 가져오기
//	List<Portfolio_Language> memberLangList = service.loadMemberLanguageService(member_id);
//	request.setAttribute("memberLangList", memberLangList);
	
	//포폴언어 소계
	List<Map<String,Object>> list0 = service.countMemberLanguageService(member_id);
	List<Map<String,String>> statLangList = new ArrayList<>();
	
	for(Map<String,Object> map: list0) {
		Map<String,String> newMap = new HashMap<>();
		for(Entry<String,Object> entry : map.entrySet()) {
			newMap.put(entry.getKey(), entry.getValue().toString());
		}
		statLangList.add(newMap);
	}
	
	
	request.setAttribute("statLangList", statLangList);

	forward.setRedirect(false);
	forward.setPath("/views/myprofile_main.jsp");
	
	return forward;
	}

}
