package org.forwork.service.chatting;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.MemberMessageRelation;
import org.forwork.domain.Message;
import org.forwork.dto.MessageCriteria;
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
	public String createMessage(Message message) {
		// TODO Auto-generated method stub
		System.out.println(message.getFile_path());
		if (message.getFile_path() == null) {
			message.setFile_path("");
		}
		mapper.insertMessage(message);
		MemberMessageRelation status = new MemberMessageRelation();
		status.setMessage_id(message.getMessage_id());
		
		List<String> memberIds = mapper.getMemberByChatroomId(message.getChatroom_id());
		memberIds.forEach(memberId -> {
			// 보낸 사람 빼고 안읽음 상태 insert
			if (!memberId.equals(message.getSender())) {
				status.setMember_id(memberId);
				mapper.insertUnreadStatus(status);
			}
		});
		
		status.setMember_id(message.getSender());
		mapper.updateReadStatus(status);
		return message.getMessage_id();
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

	@Override
	public void updateReadStatus(String messageId, String memberId) {
		// TODO Auto-generated method stub
		MemberMessageRelation status = new MemberMessageRelation();
		status.setMember_id(memberId);
		status.setMessage_id(messageId);
		mapper.updateReadStatus(status);
	}

	@Override
	public void updateReadAll(String chatroomId, String memberId) {
		// TODO Auto-generated method stub
		ChatroomMemberRelation chatroomMember = new ChatroomMemberRelation();
		chatroomMember.setChatroom_id(chatroomId);
		chatroomMember.setMember_id(memberId);
		mapper.updateReadStatusPerChatroomByMemberId(chatroomMember);
	}

	@Override
	public List<String> findMemberByChatroomId(String chatroomId) {
		// TODO Auto-generated method stub
		return mapper.getMemberByChatroomId(chatroomId);
	}

	@Override
	public List<Map<String, String>> findUnreadCountPerChatroomByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return mapper.countUnreadPerChatroomByMemberId(memberId);
	}

	@Override
	public List<MessageDto> findMessageByChatroomIdWithPaging(MessageCriteria cri, String chatroomId) {
		// TODO Auto-generated method stub
		List<MessageDto> messages = mapper.getMessageByChatroomIdWithPaging(cri, chatroomId);
		Collections.reverse(messages);
		return messages;
	}

	@Override
	public List<Member> findAllMembers() {
		// TODO Auto-generated method stub
		return mapper.getAllMembers();
	}

	@Transactional(readOnly = true)
	@Override
	public void createChatroom(String chatroomTitle, List<String> memberIds) {
		// TODO Auto-generated method stub
		Chatroom chatroom = new Chatroom();
		chatroom.setChatroom_name(chatroomTitle);
		mapper.createChatroom(chatroom);
		ChatroomMemberRelation relation = new ChatroomMemberRelation();
		relation.setChatroom_id(chatroom.getChatroom_id());
		memberIds.forEach(id -> {
			relation.setMember_id(id);
			mapper.insertChatroomMemberRelation(relation);
		});
		return;
	}
}
