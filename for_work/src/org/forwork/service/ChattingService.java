package org.forwork.service;

import java.util.List;

import org.forwork.dao.ChattingDao;
import org.forwork.domain.ChatroomMemberRelation;

public class ChattingService {
	private static ChattingService service = new ChattingService();
	private static ChattingDao dao;
	
	public static ChattingService getInstance() {
		dao = ChattingDao.getInstance();
		return service;
	}
	
//	public List<ChatroomMemberRelation> getChatroomMemberRelationService() {
//		return dao.getChatroomMemberRelation();
//	}
}
