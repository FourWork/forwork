package org.forwork.dto;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Member;
import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;

import lombok.Data;
@Data
public class MyProfileDto {
	//서비스의 트랜잭션 단위가 되는 도메인을 wrapper로 합침
	private Portfolio portfolio;
	private List<PortfolioLanguage> pfLangList;
}
