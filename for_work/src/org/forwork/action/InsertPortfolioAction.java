package org.forwork.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Portfolio;
import org.forwork.domain.Portfolio_Language;
import org.forwork.service.PortfolioService;

public class InsertPortfolioAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		PortfolioService service = PortfolioService.getInstance();
		request.setCharacterEncoding("utf-8");
				//날짜를 여기서 String->Date로 변환해야함
				Date ptfStrtDate = Date.valueOf(request.getParameter("portfolio_start_date"));
				Date ptfEndDate = Date.valueOf(request.getParameter("portfolio_end_date"));
				//세션에서 아이디 가져오기
				HttpSession session =request.getSession();

				Portfolio portfolio = new Portfolio();
				portfolio.setPortfolio_title(request.getParameter("portfolio_title"));
				portfolio.setPortfolio_start_date(ptfStrtDate);
				portfolio.setPortfolio_detail(request.getParameter("portfolio_detail"));
				portfolio.setPortfolio_end_date(ptfEndDate);
				portfolio.setMember_id(session.getAttribute("member_id").toString());
				
				System.out.println("세션id in액션:"+session.getAttribute("member_id").toString());
				System.out.println(portfolio.toString());

				
				//포트폴리오 언어배열을 가져오기위한 pflang 객체 생성
				String[] test = request.getParameterValues("portfolio_language");

				//pflang 객체에 있는 배열을 다시 pfLangObj넣음
				List<Portfolio_Language> pfLangList = new ArrayList<Portfolio_Language>() ;

				//pfLangObj
				for(int i = 0; i < test.length; i++) {
					Portfolio_Language pfLangObj= new Portfolio_Language();
					pfLangObj.setPortfolio_language(test[i]);
					pfLangList.add(pfLangObj);
				}
				
				
				
		service.insertPortfolioService(portfolio);
		service.insertPfLangService(pfLangList);
		forward.setRedirect(true);
		forward.setPath("listPortfolioAction.do");
		
		
		return forward;
	}

}
