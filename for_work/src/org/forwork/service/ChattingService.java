package org.forwork.service;

import java.util.List;

import org.forwork.dao.ChattingDao;
import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.Message;

public class ChattingService {
	private static ChattingService service = new ChattingService();
	private static ChattingDao dao;
	
	public static ChattingService getInstance() {
		dao = ChattingDao.getInstance();
		return service;
	}
	
	public List<ChatroomMemberRelation> getChatroomMemberRelationService() {
		return dao.getChatroomMemberRelation();
	}
	
	public void insertMessageService(Message message) {
		dao.insertMessage(message);
	}
	
	public List<Message> getMessageByChatroomIdService(String chatroomId){
		return dao.getMessageByChatroomId(chatroomId);
	}
	
	public List<Chatroom> getChatroomByMemberIdService(String memberId){
		return dao.getChatroomByMemberId(memberId);
	}

	public Member getMemberByIdService(String memberId) {
		return dao.getMemberById(memberId);
	}
	
	public List<Message> getLastMessagePerChatroomByMemberIdService(String memberId){
		return dao.getLastMessagePerChatroomByMemberId(memberId);
	}
}
