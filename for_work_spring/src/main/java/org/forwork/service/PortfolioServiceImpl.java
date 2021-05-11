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

//	@Override
//	public int register(Portfolio portfolio){
//		
//		log.info("Register Service---------"+portfolio);
//		return mapper.insert(portfolio);
//	}
}
