package org.forwork.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Portfolio;
import org.forwork.service.PortfolioService;

public class UpdatePortfolioAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("@updatePortfolioAction");
		ActionForward forward = new ActionForward();
		PortfolioService service = PortfolioService.getInstance();
		request.setCharacterEncoding("utf-8");
				//날짜를 여기서 String->Date로 변환해야함
				Date ptfStrtDate = Date.valueOf(request.getParameter("portfolio_start_date"));
				Date ptfEndDate = Date.valueOf(request.getParameter("portfolio_end_date"));
				//세션에서 아이디 가져오기
				HttpSession session =request.getSession();

				Portfolio portfolio = new Portfolio();
				portfolio.setPortfolio_id(request.getParameter("portfolio_id"));
				portfolio.setPortfolio_title(request.getParameter("portfolio_title"));
				portfolio.setPortfolio_start_date(ptfStrtDate);
				portfolio.setPortfolio_detail(request.getParameter("portfolio_detail"));
				portfolio.setPortfolio_end_date(ptfEndDate);
				portfolio.setMember_id(session.getAttribute("member_id").toString());
				System.out.println("@updateportfolioAction");
				System.out.println(portfolio.toString());
		
		service.updatePortfolioService(portfolio);
		forward.setRedirect(true);
		forward.setPath("listPortfolioAction.do");
		
		return forward;
	}

}
