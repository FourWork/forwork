package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.Message;
import org.forwork.dto.MessageDto;

public interface ChattingMapper {
	List<ChatroomMemberRelation> getChatroomMemberRelation();
	int insertMessage(Message message);
	List<MessageDto> getMessageByChatroomId(String chatroomId);
	List<Chatroom> getChatroomByMemberId(String memberId);
	Member getMemberById(String memberId);
	List<Message> getLastMessagePerChatroomByMemberId(String memberId);
	String getChatroomName(String chatroomId);
}