package org.forwork.service;

import java.util.List;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PortfolioServiceImpl implements PortfolioService {@Override
	public int register(Portfolio vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Portfolio> getList(Portfolio vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(Portfolio vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(String portfolio_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override 	
	public int registerLang(PortfolioLanguage vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeLang(PortfolioLanguage vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
