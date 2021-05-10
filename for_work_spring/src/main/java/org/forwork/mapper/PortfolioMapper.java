package org.forwork.mapper;

import java.util.List;
import java.util.Map;

import org.forwork.domain.PortfolioLanguage;
import org.forwork.domain.Portfolio;

public interface PortfolioMapper {

	public int insert(Portfolio vo);
	public Portfolio read(String portfolio_id);
	
	//Ʈ����Ǵ���(delete-delete2)
	public int delete(String portfolio_id);
	public int delete2(String portfolio_id);
	
	//Ʈ����� ����(update-delte2-insertPfLang) 
	public int update(Portfolio vo);
	
	public List<Portfolio> listPortfolio(String member_id);
	
	//getPortfolio_max_id�� ���񽺴ܿ��� ����
	public int insertPfLang(PortfolioLanguage vo);
	
	public int getPortfolio_max_id();
	public List<Map<String,Object>> countMemberLanguage(String member_id);

}
