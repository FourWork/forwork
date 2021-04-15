package org.forwork.service;

import java.util.List;
import java.util.Map;

import org.forwork.dao.PortfolioDAO;
import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;
import org.forwork.domain.Portfolio_Language;

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
	
	public List<Portfolio_Language> listLanguageService(String member_id) throws Exception{
		List<Portfolio_Language> list = dao.listLanguages(member_id);
		return list;
	}
	
	public Member loadMemberCard(String member_id) throws Exception{
		Member member = dao.loadMemberCard(member_id);
		return member;
	}
	
//	public List<Portfolio_Language> loadMemberLanguageService(String member_id)throws Exception{
//		List<Portfolio_Language> list = dao.loadMemberLanguage(member_id);
//		return list;
//	}
	public List<Map<String,Object>> countMemberLanguageService(String member_id)throws Exception{
		List<Map<String,Object>> list= dao.countMemberLanguage(member_id);
		return list;
	}
	
	public int insertPortfolioService(Portfolio portfolio)throws Exception {
		return dao.insertPortfolio(portfolio);
	}
	
	public int insertPfLangService(List<Portfolio_Language> pfLangList)throws Exception{
		int x= 0;
		for(int i =0; i<pfLangList.size();i++) {
			String id = dao.getPortfolio_max_id();
			System.out.println("aaaaaaaaaaaaaaaaaaid: " + id);
			Portfolio_Language portfolio_Language = pfLangList.get(i);
			System.out.println(portfolio_Language.getPortfolio_language());
			portfolio_Language.setPortfolio_id(id);
			x += dao.insertPfLanguage(portfolio_Language);
		}
		
		System.out.println("x value at PortfolioService"+x);
		return x;
	}

}
