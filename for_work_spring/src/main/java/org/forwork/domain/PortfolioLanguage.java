package org.forwork.domain;

import java.io.Serializable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class PortfolioLanguage implements Serializable {
	private String portfolio_id;
	private String portfolio_language;
}
