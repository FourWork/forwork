package org.forwork.service;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;

public interface PortfolioService {
	public Portfolio read(String portfolio_id);
	public void register(Portfolio portfolio, PortfolioLanguage pfLang);
	public void update(Portfolio portfolio, PortfolioLanguage pfLang);
	public void delete(String portfolio_id);
	public List<PortfolioLanguage> readPfLang(String portfolio_id);
	public List<Map<String, String>> countLang(String member_id);
}
