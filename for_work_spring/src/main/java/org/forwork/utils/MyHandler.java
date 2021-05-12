package org.forwork.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.Session;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class MyHandler extends TextWebSocketHandler {
	
	// 세션 리스트
	private List<WebSocketSession> sessionList = Collections.synchronizedList(new ArrayList<>());
//
//	private class User {
//		WebSocketSession session;
//		String userId;
//		String chatroomId;
//	}
//	
	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		log.info("{} 연결됨" + session.getId());
	}

	// 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("{}로 부터 {} 받음" + session.getId() + message.getPayload());
		// 모든 유저에게 메세지 출력
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
	}

	// 클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		log.info("{} 연결 끊김." + session.getId());
	}
}
