package org.forwork.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.forwork.dao.PortfolioDAO;
import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;

public class PortfolioService {
	private static PortfolioService service = new PortfolioService();
	private static PortfolioDAO dao;
	
	public static PortfolioService getInstance() {
		dao = PortfolioDAO.getInstance();
		return service;
	}
	
	public List<Portfolio> listPortfolioService(String member_id) throws Exception{
		List<Portfolio> list = dao.listPortfolio(member_id);
		return list;
	}
	
	
	public Member loadMemberCard(String member_id) throws Exception{
		Member member = dao.loadMemberCard(member_id);
		return member;
	}
	
	public int insertPortfolioService(HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("at Service");
		System.out.println(request.getParameter("portfolio_start_date").toString());
		System.out.println(request.getParameter("portfolio_title").toString());
		//날짜를 여기서 String->Date로 변환해야함
		Date ptfStrtDate = Date.valueOf(request.getParameter("portfolio_start_date"));
		Date ptfEndDate = Date.valueOf(request.getParameter("portfolio_end_date"));
		//세션에서 아이디 가져오기
		HttpSession session =request.getSession();
		;
		
		Portfolio portfolio = new Portfolio();
		portfolio.setPortfolio_title(request.getParameter("portfolio_title"));
		portfolio.setPortfolio_start_date(ptfStrtDate);
		portfolio.setPortfolio_detail(request.getParameter("portfolio_detail"));
		portfolio.setPortfolio_end_date(ptfEndDate);
		portfolio.setMember_id(session.getAttribute("member_id").toString());
		return dao.insertPortfolio(portfolio);
	}
	

}
