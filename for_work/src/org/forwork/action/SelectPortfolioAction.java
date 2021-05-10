package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Portfolio;
import org.forwork.service.PortfolioService;

public class SelectPortfolioAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		PortfolioService service = PortfolioService.getInstance();

		//선택한 포폴아이디의 포폴객체 생성
		String portfolio_id = request.getParameter("portfolio_id");
		System.out.println("포폴아이디"+portfolio_id);
		Portfolio portfolio = service.selectPortfolioService(portfolio_id);
		System.out.println(portfolio);
		
		request.setAttribute("portfolio", portfolio);
		
		forward.setRedirect(false);
		forward.setPath("/views/myprofile_updatePortfolio.jsp");
		
		return forward;
	}

}
