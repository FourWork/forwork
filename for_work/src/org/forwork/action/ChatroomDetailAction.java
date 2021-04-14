package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Chatroom;
import org.forwork.domain.Message;
import org.forwork.service.ChattingService;

public class ChatroomDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO: 모든 페이지에서 DB로부터 chatrooms를 얻어서 setAttribute해주는 부분을 어떻게 리팩토링할 수 있을지 생각
		ActionForward af = new ActionForward();
		ChattingService service = ChattingService.getInstance();
		
		HttpSession session = request.getSession();
		List<Chatroom> chatrooms = service.getChatroomByMemberIdService((String)session.getAttribute("userId"));
		request.setAttribute("chatrooms", chatrooms);
		
		String chatroomId = request.getParameter("chatroomId");
		List<Message> messages = service.getMessageByChatroomIdService(chatroomId);
		request.setAttribute("messages", messages);
		
		String chatroomName = service.getChatroomNameByIdService(chatroomId);
		request.setAttribute("chatroomName", chatroomName);
		
		session.setAttribute("chatroomId", chatroomId);
		
		af.setRedirect(false);
		af.setPath("/views/chatting/chatroomDetail.jsp");
		
		return af;
	}

}
