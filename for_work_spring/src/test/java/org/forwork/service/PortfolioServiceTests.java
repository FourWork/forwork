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
	portfolio.setPortfolio_title("서버테스트_Portfolio 210512");
	portfolio.setPortfolio_detail("서버테스트_Detail 210512");
	
	pfLang.setPortfolio_language("서버테스트_language 210512");
	
	service.register(portfolio, pfLang);
	
	}
	
//	@Test
//	public void testUpdate(){
//		Portfolio portfolio = service.read("99");
//		portfolio.setPortfolio_detail("서버테스트 @Service");
//		portfolio.setPortfolio_title("서버테스트 @Service");
//		log.info("----in testUpdate-----");
//		log.info(portfolio);
//		PortfolioLanguage pfLang = new PortfolioLanguage();
//		pfLang.setPortfolio_language("Java");
//		service.update(portfolio, pfLang);
//	}
}
