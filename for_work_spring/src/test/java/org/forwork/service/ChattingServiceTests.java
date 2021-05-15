package org.forwork.service;

import static org.junit.Assert.assertNotNull;

import org.forwork.domain.Message;
import org.forwork.service.chatting.ChattingService;
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
public class ChattingServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ChattingService service;
	
//	@Test
//	public void testExists() {
//		log.info(service);
//		assertNotNull(service);
//	}
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
	
	@Test
	public void testInsertUnreadStatus() {
		Message msg = new Message();
		msg.setMessage("test message");
		msg.setChatroom_id("3");
		msg.setSender("1");
		msg.setSend_time("2021-05-11 15:40:00");
		service.createMessage(msg);
	}
}
