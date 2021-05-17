package org.forwork.domain;

import java.util.List;

import lombok.Data;
@Data
public class MyProfileWrapper {
	
	private Portfolio portfolio;
	private List<Portfolio> portfolioList;
	private List<PortfolioLanguage> pfLangList;
	private PortfolioLanguage pfLang;
	private Member member;
}
