package org.forwork.service;

import static org.junit.Assert.assertNotNull;

import org.forwork.domain.Message;
import org.forwork.service.chatting.ChattingService;
import org.forwork.service.chatting.GetSetService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes={ org.forwork.config.RootConfig.class })
@Log4j
public class ChattingServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ChattingService service;
	
	@Setter(onMethod_ = @Autowired)
	private GetSetService service2;
	
	@Test
	public void testExists() {
		log.info(service2);
		assertNotNull(service2);
	}
//	
//	@Test
//	public void testFindChatroomMemberRelations() {
//		service.findChatroomMemberRelations().forEach(relation -> log.info(relation));
//	}
//	
//	@Test
//	public void testFindChatroomName() {
//		service.findChatroomName("3");
//	}
//	
//	@Test
//	public void testInsertMessage() {
//		Message msg = new Message();
//		msg.setMessage("마지막 메세지 테스트22");
//		msg.setChatroom_id("1");
//		msg.setSender("1");
//		msg.setSend_time("2021-05-17 14:32:00");
//		service.createMessage(msg);
//	}
//	
//	@Test
//	public void testUpdateReadStatus() {
//		service.updateReadStatus("267", "4");
//	}
//	
//	@Test
//	public void testUpdateReadAll() {
//		service.updateReadAll("1", "2");
//	}
	
	@Test
	public void testGetSetService() {
		service2.test();
	}
}
