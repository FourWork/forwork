package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Message;

public interface ChattingMapper {
	List<ChatroomMemberRelation> getChatroomMemberRelation();
	int insertMessage(Message message);
}
