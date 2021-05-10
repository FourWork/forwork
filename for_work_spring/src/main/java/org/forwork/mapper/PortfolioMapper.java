package org.forwork.mapper;

import java.util.List;
import java.util.Map;

import org.forwork.domain.PortfolioLanguageVO;
import org.forwork.domain.PortfolioVO;

public interface PortfolioMapper {

	public int insert(PortfolioVO vo);
	public PortfolioVO read(String portfolio_id);
	public int delete(String portfolio_id);
	public int update(PortfolioVO vo);
	public List<PortfolioVO> listPortfolio(String member_id);
	
	public int insertPfLang(PortfolioLanguageVO vo);
	List<Map<String,Object>> countMemberLanguage(String member_id);
	
}
