package org.forwork.domain;

import java.io.Serializable;
import java.util.Arrays;

@SuppressWarnings("serial")
public class Portfolio_Language implements Serializable {
	private String portfolio_id;
	private String portfolio_language;
	
	public Portfolio_Language() {}

	public Portfolio_Language(String portfolio_id, String[] portfolio_languageArr, String portfolio_language) {
		super();
		this.portfolio_id = portfolio_id;
		this.portfolio_language = portfolio_language;
	}

	public String getPortfolio_id() {
		return portfolio_id;
	}

	public void setPortfolio_id(String portfolio_id) {
		this.portfolio_id = portfolio_id;
	}


	public String getPortfolio_language() {
		return portfolio_language;
	}

	public void setPortfolio_language(String portfolio_language) {
		this.portfolio_language = portfolio_language;
	}

	@Override
	public String toString() {
		return "Portfolio_Language [portfolio_id=" + portfolio_id + ", portfolio_languageArr="
				 + ", portfolio_language=" + portfolio_language + "]";
	}
	
}
