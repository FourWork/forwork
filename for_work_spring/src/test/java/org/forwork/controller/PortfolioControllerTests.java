package org.forwork.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.Servlet;

import org.forwork.config.ServletConfig;
import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes={
		org.forwork.config.RootConfig.class,
		org.forwork.config.ServletConfig.class})
@Log4j
public class PortfolioControllerTests {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup(){
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testList() throws Exception{
//		log.info("--------------controllerTests---------------");
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/MyProfile/member_id/2"))
//				.andReturn()
//				.getModelAndView()
//				.getViewName());
//	}
	
//	@Test
//	public void testRegister() throws Exception{
////		Portfolio reqPortfolio= new Portfolio();
////		reqPortfolio.setMember_id("2");
////		reqPortfolio.setPortfolio_title("controllerTests_title");
////		reqPortfolio.setPortfolio_detail("controllerTests_detail");
//
//		String reqPortfolio="{
//		    "portfolio_id": "98",
//		    "member_id": "1",
//		    "portfolio_title": "Portfolio update TEST title",
//		    "portfolio_start_date": 1620781522000,
//		    "portfolio_end_date": 1620781522000,
//		    "portfolio_detail": "Portfolio update TEST detail"
//		  }";
//		
//		List<PortfolioLanguage> reqList =new ArrayList<PortfolioLanguage>();
//		PortfolioLanguage lang = new PortfolioLanguage();
//		for(int i =1; i < 5 ; i++){
//			lang.setPortfolio_language("language"+i);
//			reqList.add(lang);
//		}
//		
//		log.info("-------------controllerTests-------------");
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/MyProfile/new")
//				.param("portfolio", reqPortfolio)
//				.param("pfLang", reqList))
//				.andRet
//	}
}
