package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;


public interface PortfolioMapper {
	List<Portfolio> listPortfolio(String member_id);
	int insertPortfolio(Portfolio portfolio);
	Member loadMemberCard(String member_id);
}
