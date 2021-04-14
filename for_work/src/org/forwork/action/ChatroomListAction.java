package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Chatroom;
import org.forwork.service.ChattingService;

public class ChatroomListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward af = new ActionForward();
		ChattingService service = ChattingService.getInstance();
		
		String userId = request.getParameter("memberId");
		
		List<Chatroom> chatrooms = service.getChatroomByMemberIdService(request.getParameter("memberId"));
		
		request.setAttribute("chatrooms", chatrooms);
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		
		// 처음에 실행하고 chatrooomId 설정해주는 위치? -> url 파라미터로 넘겨줌
		af.setRedirect(false);
		af.setPath("/views/chatting/chatroomList.jsp");
		
		return af;
	}

}
