package org.forwork.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

import org.forwork.domain.PortfolioLanguage;
import org.forwork.domain.Portfolio;
import org.forwork.mapper.PortfolioMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes={ org.forwork.config.RootConfig.class})
@Log4j
public class PortfolioMapperTests {

	private String[] memArr={"1","2","3","4"};
	
	@Setter(onMethod_= @Autowired)
	private PortfolioMapper mapper;
	
	@Test
	public void testMapper(){
		log.info(mapper);
	}
	
//	@Test
//	public void testCreate(){
//		IntStream.rangeClosed(1,100).forEach(i->{
//			PortfolioVO vo = new PortfolioVO();
//			
//			vo.setMember_id(memArr[i%4]);
//			vo.setPortfolio_title("포트폴리오 제목"+i);
//			vo.setPortfolio_detail("포폴 내용"+i);
//			
//			mapper.insert(vo);
//		});
//	}
	
//	@Test
//	public void testRead(){
//		String targetPId = "42";
//		PortfolioVO vo = mapper.read(targetPId);
//		log.info(vo);
//	}
	
//	@Test
//	public void testUpdate(){
//		String targetPId="41";
//		PortfolioVO vo = mapper.read(targetPId);
//		vo.setPortfolio_title("스프링으로 수정하는 제목");
//		vo.setPortfolio_detail("스프링 프레임워크의 사용을 구현 ㅎ");
//		mapper.update(vo);
//		
//	}
	
//	@Test
//	public void testDelete(){
//		String targePID="49";
//		mapper.delete(targePID);
//	}
	
//	@Test
//	public void testInsertPfLang(){
//		PortfolioLanguageVO vo= new PortfolioLanguageVO();
//		vo.setPortfolio_language("Java");
//		mapper.insertPfLang(vo);
//	}
	
//	@Test
//	public void testPfLangStat(){
//		String mID="1";
//		log.info(mapper.countMemberLanguage(mID));
//	}
	
//	@Test
//	public  void testMaxPid(){
//		log.info(mapper.getPortfolio_max_id());
//	}
	
	//멤버id-포트폴리오id 결합해서 갖고오는부분 쿼리 수정할거신가?
}
