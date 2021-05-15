package org.forwork.service.chatting;

import java.util.List;

import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.MemberMessageRelation;
import org.forwork.domain.Message;
import org.forwork.dto.MessageDto;
import org.forwork.mapper.ChattingMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional(readOnly = true)
	@Override
	public void createMessage(Message message) {
		// TODO Auto-generated method stub
		mapper.insertMessage(message);
		MemberMessageRelation status = new MemberMessageRelation();
		status.setMessage_id(message.getMessage_id());
		// TODO: 채팅방에 속한 멤버 얻어와서 모든 멤버에 대해 돌리기 
		List<String> memberIds = mapper.getMemberByChatroomId(message.getChatroom_id());
		memberIds.forEach(memberId -> {
			status.setMember_id(memberId);
			mapper.insertUnreadStatus(status);
		});
	}

	@Override
	public List<MessageDto> findMessageByChatroomId(String chatroomId) {
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

	@Override
	public String findChatroomName(String chatroomId) {
		// TODO Auto-generated method stub
		return mapper.getChatroomName(chatroomId);
	}

//	@Override
//	public void updateReadStatus(String chatroomId, String memberId) {
//		// TODO Auto-generated method stub
//		mapper.updateReadStatus(chatroomId, memberId);
//	}

}
