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
//			vo.setPortfolio_title("��Ʈ������ ����"+i);
//			vo.setPortfolio_detail("���� ����"+i);
//			
//			mapper.insert(vo);
//		});
//	}
	
	@Test
	public void testRead(){
		String targetPId = "42";
		Portfolio vo = mapper.read(targetPId);
		log.info(vo);
	}
	
//	@Test
//	public void testUpdate(){
//		String targetPId="41";
//		PortfolioVO vo = mapper.read(targetPId);
//		vo.setPortfolio_title("���������� �����ϴ� ����");
//		vo.setPortfolio_detail("������ �����ӿ�ũ�� ����� ���� ��");
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
//		PortfolioLanguage vo= new PortfolioLanguage();
//		String language="A";
//		vo.setPortfolio_language(language);
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
	
}
