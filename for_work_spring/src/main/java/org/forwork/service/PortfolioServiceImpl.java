package org.forwork.service;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;
import org.forwork.mapper.PortfolioMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
//import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class PortfolioServiceImpl implements PortfolioService {
	

	private PortfolioMapper mapper;
	
	@Transactional
	@Override
	public void register(Portfolio portfolio, PortfolioLanguage pfLang) {
		
		log.info("--------RegisterService-----------");
		mapper.insert(portfolio);
		log.info("--------RegisterService_insert_Portfolio-----------");
		mapper.insertPfLang(pfLang);
		log.info("--------RegisterService_insert_Pflang-----------");
		
	}
	@Transactional
	@Override
	public void update(Portfolio portfolio, PortfolioLanguage pfLang) {
		
		log.info("-------------UpdateService------------");
		mapper.update(portfolio);
		log.info("-------------UpdateService_update_portfolio----------");
		mapper.deletePfLang(portfolio.getPortfolio_id());
		mapper.updatePfLang(pfLang);
	}

	@Override
	public Portfolio read(String portfolio_id) {
		
		return mapper.read(portfolio_id);
	}

	
}
