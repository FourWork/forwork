package org.forwork.service;

import java.util.List;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;

public interface PortfolioService {
	
	public int register(Portfolio vo);
	public int registerLang(PortfolioLanguage vo);
	
	public int modify(Portfolio vo);
	
	public int remove(String portfolio_id);
	public int removeLang(PortfolioLanguage vo);
	
	public List<Portfolio> getList(Portfolio vo);
	
}
