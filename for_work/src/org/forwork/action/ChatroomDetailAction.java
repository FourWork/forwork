package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Message;
import org.forwork.service.ChattingService;

public class ChatroomDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward af = new ActionForward();
		ChattingService service = ChattingService.getInstance();
		
		String chatroomId = request.getParameter("chatroomId");
		List<Message> messages = service.getMessageByChatroomIdService(chatroomId);
		request.setAttribute("messages", messages);
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", "1");
		session.setAttribute("chatroomId", chatroomId);
		
		af.setRedirect(false);
		af.setPath("/views/chatting/chatroomDetail.jsp");
		
		return af;
	}

}
