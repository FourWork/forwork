package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Chatroom;
import org.forwork.domain.Member;
import org.forwork.domain.Message;
import org.forwork.dto.ChatroomDto;
import org.forwork.service.ChattingService;

public class ChatroomListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// chatrooms, userId, name 모두 세션에 저장
		ActionForward af = new ActionForward();
		ChattingService service = ChattingService.getInstance();
		
		String userId = request.getParameter("memberId");
		Member loggedInUser = service.getMemberByIdService(userId);
		
		ChatroomDto chatrooms = new ChatroomDto();
		chatrooms.setChatrooms(service.getChatroomByMemberIdService(userId));

		List<Message> messages = service.getLastMessagePerChatroomByMemberIdService(userId);
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("name", loggedInUser.getName());
		session.setAttribute("chatrooms", chatrooms);
		// TODO: 새로운 메세지가 들어오면 service 다시 콜하도록 위치 수정
		session.setAttribute("messages", messages);
		
		af.setRedirect(false);
		af.setPath("/views/chatting/chatroomList.jsp");
		
		return af;
	}

}
