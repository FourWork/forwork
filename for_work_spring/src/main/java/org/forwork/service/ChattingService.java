package org.forwork.service;

import java.util.List;

import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.Message;
import org.forwork.dto.MessageDto;

public interface ChattingService {
	List<ChatroomMemberRelation> findChatroomMemberRelations();
	int createMessage(Message message);
	List<MessageDto> findMessageByChatroomId(String chatroomId);
	List<Chatroom> findChatroomByMemberId(String memberId);
	Member findMemberById(String memberId);
	List<Message> findLastMessagePerChatroomByMemberId(String memberId);
	String findChatroomName(String chatroomId);
}
