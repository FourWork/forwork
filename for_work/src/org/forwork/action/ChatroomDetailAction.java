package org.forwork.action;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.forwork.domain.Chatroom;
import org.forwork.domain.Message;
import org.forwork.dto.ChatroomDto;
import org.forwork.service.ChattingService;

public class ChatroomDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 세션에 저장된 chatrooms 사용
		// url 인자로 넘어온 chatroomId를 세션에 저장(소켓에 연결됐을때 저장해주기 위함)
		ActionForward af = new ActionForward();
		ChattingService service = ChattingService.getInstance();
		
		HttpSession session = request.getSession();
		
		ChatroomDto chatroomDto = (ChatroomDto) session.getAttribute("chatrooms");
		List<Chatroom> chatrooms = chatroomDto.getChatrooms();
		
		String chatroomId = request.getParameter("chatroomId");
		List<Message> messages = service.getMessageByChatroomIdService(chatroomId);
		request.setAttribute("messages", messages);
		
		Optional<Chatroom> selectedChatroom = chatrooms.stream().filter(x-> x.getChatroom_id().equals(chatroomId)).findFirst();
		
		if (selectedChatroom.isPresent()) {
			request.setAttribute("chatroomName", selectedChatroom.get().getChatroom_name());
		} else {
			request.setAttribute("chatroomName", "없음");
		}
		
		// 소켓에서 사용
		session.setAttribute("chatroomId", chatroomId);
		
		af.setRedirect(false);
		af.setPath("/views/chatting/chatroomDetail.jsp");
		
		return af;
	}

}
