package org.forwork.service;

import static org.junit.Assert.assertNotNull;

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
	
	@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testFindChatroomMemberRelations() {
		service.findChatroomMemberRelations().forEach(relation -> log.info(relation));
	}
	
	@Test
	public void testFindChatroomName() {
		service.findChatroomName("3");
	}
}
