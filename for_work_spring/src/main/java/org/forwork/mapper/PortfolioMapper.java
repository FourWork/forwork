package org.forwork.mapper;

import java.util.List;
import java.util.Map;

import org.forwork.domain.PortfolioLanguage;
import org.forwork.domain.Portfolio;

public interface PortfolioMapper {

	public int insert(Portfolio vo);
	public Portfolio read(String portfolio_id);
	
	//트랜잭션 단위(delete-deletePfLang)
	public int delete(String portfolio_id);
	public int deletePfLang(String portfolio_id);
	
	//트랜잭션 단위(update-deltePfLang-updatePfLang) 
	public int update(Portfolio vo);
	
	public List<Portfolio> listPortfolio(String member_id);
	
	public int insertPfLang(PortfolioLanguage vo);
	public int updatePfLang(PortfolioLanguage vo);
	
	public List<Map<String,Object>> countMemberLanguage(String member_id);

}
