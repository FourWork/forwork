package org.forwork.domain;

public class Portfolio {
	private String portfolio_id;
	private String member_id;
	private String portfolio_title;
	private String portfolio_start_date; 
	private String portfolio_end_date;
	private String portfolio_detail;

public Portfolio( ) {}

public Portfolio(String portfolio_id, String member_id, String portfolio_title, String portfolio_start_date,
		String portfolio_end_date, String portfolio_detail) {
	super();
	this.portfolio_id = portfolio_id;
	this.member_id = member_id;
	this.portfolio_title = portfolio_title;
	this.portfolio_start_date = portfolio_start_date;
	this.portfolio_end_date = portfolio_end_date;
	this.portfolio_detail = portfolio_detail;
}

public String getPortfolio_id() {
	return portfolio_id;
}

public void setPortfolio_id(String portfolio_id) {
	this.portfolio_id = portfolio_id;
}

public String getMember_id() {
	return member_id;
}

public void setMember_id(String member_id) {
	this.member_id = member_id;
}

public String getPortfolio_title() {
	return portfolio_title;
}

public void setPortfolio_title(String portfolio_title) {
	this.portfolio_title = portfolio_title;
}

public String getPortfolio_start_date() {
	return portfolio_start_date;
}

public void setPortfolio_start_date(String portfolio_start_date) {
	this.portfolio_start_date = portfolio_start_date;
}

public String getPortfolio_end_date() {
	return portfolio_end_date;
}

public void setPortfolio_end_date(String portfolio_end_date) {
	this.portfolio_end_date = portfolio_end_date;
}

public String getPortfolio_detail() {
	return portfolio_detail;
}

public void setPortfolio_detail(String portfolio_detail) {
	this.portfolio_detail = portfolio_detail;
};


}