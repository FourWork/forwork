package org.forwork.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
	
	
	
	@Override
	public Portfolio read(String portfolio_id) {
		
		return mapper.read(portfolio_id);
	}
	
	@Transactional
	@Override
	public int register(Portfolio portfolio, List<PortfolioLanguage> pfLangList) {
		
		log.info("--------RegisterService-----------");
		int returnInteger = mapper.insert(portfolio);
		log.info("--------RegisterService_insert_Portfolio-----------");
		List<PortfolioLanguage> list = pfLangList;
		for(PortfolioLanguage pfLang : pfLangList){
			mapper.insertPfLang(pfLang);
			log.info("--------RegisterService_insert_Pflang"+pfLang+"-----------");
		}
		return returnInteger;
	}
	
	@Transactional
	@Override
	public void update(Portfolio portfolio, PortfolioLanguage pfLang) {
		//PortfolioLanguage가 삭제-삽입 되는 로직 추후에 변경필요
		log.info("-------------UpdateService------------");
		mapper.update(portfolio);
		log.info("-------------UpdateService_update_portfolio----------");
		mapper.deletePfLang(portfolio.getPortfolio_id());
		mapper.updatePfLang(pfLang);
	}
	
	@Transactional
	@Override
	public void delete(String portfolio_id) {
		log.info("-------------DeleteService-------------");
		mapper.deletePfLang(portfolio_id);
		mapper.delete(portfolio_id);
	}

	@Override
	public List<PortfolioLanguage> readPfLang(String portfolio_id) {
		log.info("-------------readPfLangService-------------");
		List<PortfolioLanguage> pfLangList = mapper.readPfLang(portfolio_id);
		return pfLangList;
	}

	@Override
	public List<Map<String, String>> countLang(String member_id) {
		log.info("------------countLangService---------------");
		//google api 사용을 위한 형변환
		List<Map<String,Object>> list0 = mapper.rollupLanguage(member_id);
		List<Map<String,String>> statLangList = new ArrayList<>();
		
		for(Map<String,Object> map: list0) {
			Map<String,String> newMap = new HashMap();
			for(Entry<String,Object> entry : map.entrySet()) {
				newMap.put(entry.getKey(), entry.getValue().toString());
			}
			statLangList.add(newMap);
		}
		
		return statLangList;
	}

	@Override
	public List<Portfolio> getList(String member_id) {
	 
		return mapper.listPortfolio(member_id);
	}
	
	
	
	
}
