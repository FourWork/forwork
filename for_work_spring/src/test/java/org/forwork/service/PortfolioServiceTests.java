package org.forwork.service;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration(classes={org.forwork.config.RootConfig.class})
@WebAppConfiguration
public class PortfolioServiceTests {

	@Setter(onMethod_={@Autowired})
	private PortfolioService service;
	
	@Test
	public void testService(){
		log.info(service);
	}
	
	@Test
	public void testRegister(){
	Portfolio portfolio = new Portfolio();
	PortfolioLanguage pfLang = new PortfolioLanguage();
	portfolio.setMember_id("1");
	portfolio.setPortfolio_title("�����׽�Ʈ_Portfolio");
	portfolio.setPortfolio_detail("�����׽�Ʈ_Detail");
	
	pfLang.setPortfolio_language("�����׽�Ʈ_���");
	
	service.register(portfolio, pfLang);
	
	}
	
//	@Test
//	public void testRegister(){
//		Portfolio portfolio = new Portfolio();
//		portfolio.setMember_id("1");
//		portfolio.setPortfolio_title("�����׽�Ʈ_Portfolio");
//		portfolio.setPortfolio_detail("�����׽�Ʈ_Detail");
//		
//		service.register(portfolio);
//	}
}
