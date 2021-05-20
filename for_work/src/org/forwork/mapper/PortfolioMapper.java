package org.forwork.mapper;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;
import org.forwork.domain.Portfolio_Language;


public interface PortfolioMapper {
	List<Portfolio> listPortfolio(String member_id);
	List<Portfolio_Language> listLanguage(String member_id);
	int insertPortfolio(Portfolio portfolio);
	Member loadMemberCard(String member_id);
	int insertPfLanguage(Portfolio_Language pfLang);
	String getPortfolio_max_id();
	int updatePortfolio(Portfolio portfolio);
//	List<Portfolio_Language> loadMemberLanguage(String member_id);
	Portfolio selectPortfolio(String portfolio_id);
	List<Map<String,Object>> countMemberLanguage(String member_id);
}
