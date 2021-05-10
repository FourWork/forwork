package org.forwork.service;

import java.util.List;

import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.Message;
import org.forwork.mapper.ChattingMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ChattingServiceImpl implements ChattingService {
	private ChattingMapper mapper;

	@Override
	public List<ChatroomMemberRelation> findChatroomMemberRelations() {
		// TODO Auto-generated method stub
		return mapper.getChatroomMemberRelation();
	}

	@Override
	public int createMessage(Message message) {
		// TODO Auto-generated method stub
		return mapper.insertMessage(message);
	}

	@Override
	public List<Message> findMessageByChatroomId(String chatroomId) {
		// TODO Auto-generated method stub
		return mapper.getMessageByChatroomId(chatroomId);
	}

	@Override
	public List<Chatroom> findChatroomByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return mapper.getChatroomByMemberId(memberId);
	}

	@Override
	public Member findMemberById(String memberId) {
		// TODO Auto-generated method stub
		return mapper.getMemberById(memberId);
	}

	@Override
	public List<Message> findLastMessagePerChatroomByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return mapper.getLastMessagePerChatroomByMemberId(memberId);
	}
}
