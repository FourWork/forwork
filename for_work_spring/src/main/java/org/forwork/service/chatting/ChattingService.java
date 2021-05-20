package org.forwork.service.chatting;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.Message;
import org.forwork.dto.MessageDto;

public interface ChattingService {
	List<ChatroomMemberRelation> findChatroomMemberRelations();
	String createMessage(Message message);
	List<MessageDto> findMessageByChatroomId(String chatroomId);
	List<Chatroom> findChatroomByMemberId(String memberId);
	Member findMemberById(String memberId);
	List<Message> findLastMessagePerChatroomByMemberId(String memberId);
	String findChatroomName(String chatroomId);
	void updateReadStatus(String messageId, String memberId);
	void updateReadAll(String chatroomId, String memberId);
	List<String> findMemberByChatroomId(String chatroomId);
	List<Map<String, String>> findUnreadCountPerChatroomByMemberId(String memberId);
}