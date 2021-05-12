package org.forwork.service;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;

public interface PortfolioService {
	public void register(Portfolio portfolio, PortfolioLanguage pfLang);
	public void update(Portfolio portfolio, PortfolioLanguage pfLang);
	public Portfolio read(String portfolio_id);
}
