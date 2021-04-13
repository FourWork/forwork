package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Message;
import org.forwork.service.ChattingService;

public class ChatroomDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward af = new ActionForward();
		ChattingService service = ChattingService.getInstance();
		
		List<Message> messages = service.getMessageByChatroomIdService((String)request.getAttribute("chatroomId"));
		
		// 처음에 실행하고 chatrooomId 설정해주는 위치?
		af.setRedirect(false);
		af.setPath("/views/chatting/chatting.jsp");
		
		return null;
	}

}
