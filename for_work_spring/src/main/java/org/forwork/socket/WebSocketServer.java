
package org.forwork.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.Message;
import org.forwork.dto.MessageDto;
import org.forwork.mapper.ChattingMapper;
import org.forwork.service.ChattingService;
import org.forwork.service.ChattingServiceImpl;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Controller
@RequiredArgsConstructor
@ServerEndpoint(value = "/websocket", configurator = HttpSessionConfigurator.class)
public class WebSocketServer {
	private static Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());

	// TODO: socket session 연결(OnOpen)이랑 연결 끊는 부분(OnClose) 수정하기
	private static List<ChatroomMemberRelation> chatroomMemberRelations = Collections.synchronizedList(new ArrayList<>());
	// 같은 유저라도 채팅방 여러개에 들어가있다면 세션이 여러개
	private static List<User> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	
//	@Setter(onMethod_ = {@Autowired})
//	@Inject
//	@Setter(onMethod_ = {@Autowired})
	private static ChattingServiceImpl service;

	private class User {
		Session session;
		String userId;
		String chatroomId;
	}
	
	// TODO: 여기서 DB 내용을 바로 가져오는게 아니라 chatroom-member-relation 테이블이 수정되면 이 함수만 call하도록 수정 
	public void setChatroomMemberRelations() {
		chatroomMemberRelations.clear();
		List<ChatroomMemberRelation> results = service.findChatroomMemberRelations();
		for(ChatroomMemberRelation result: results) {
			chatroomMemberRelations.add(result);
//			System.out.println(result);
		}
	}

	public User getUser(Session userSession) {
		Optional<User> op = sessionUsers.stream().filter(x -> x.session == userSession).findFirst();
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public User getUser(String userId, String chatrooomId) {
		Optional<User> op = sessionUsers.stream().filter((x) -> x.userId.equals(userId) && x.chatroomId.equals(chatrooomId)).findFirst();
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	@OnOpen
	public void handleConnection(Session userSession, EndpointConfig config) {
		
		// TODO: 여기 말고 다른 곳에서 하도록 수정
		setChatroomMemberRelations();
		
		if (!configs.containsKey(userSession)) {
			configs.put(userSession, config);
		}
		// TODO: 접속 종료된 user 지우기 
		User user = new User();
		user.session = userSession;
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);
		user.userId = (String) httpSession.getAttribute("userId");
		user.chatroomId = (String) httpSession.getAttribute("chatroomId");
		System.out.println("herere");
		System.out.println(user.userId);
		System.out.println(user.chatroomId);
		sessionUsers.add(user);
		
		for(User u: sessionUsers) {
			System.out.println(u.userId);
		}
	}
	
	// 소켓에 메세지가 들어왔을 때
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		User user = getUser(userSession);
		
//		if (user == null) {
//			User newUser = new User();
//			newUser.session = userSession;
//			newUser.userId = "1";
//			sessionUsers.add(newUser);
//		}
		
		JSONParser parser = new JSONParser();
		Object object = null;

		try {
			object = parser.parse(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject ob = (JSONObject) object;
		
		String chatroomId = (String)ob.get("chatroomId");
		List<String> sendingUserIds = new ArrayList<String>();
		for(ChatroomMemberRelation relation: chatroomMemberRelations) {
			if (relation.getChatroom_id().equals(chatroomId)) {
				sendingUserIds.add(relation.getMember_id());
			}
		}
		
		// TODO: 페이지 별로 채팅방 구분
		for(String sendingUserId: sendingUserIds) {
			User sendTo = getUser(sendingUserId, chatroomId);
			if (sendTo != null) {
				// 자기랑 연결된 소켓에 보낼때는 그냥 send
				System.out.println(ob.toJSONString());
				sendTo.session.getBasicRemote().sendText(ob.toJSONString());
			}
		}
		
		// 메세지 저장
		Message msg = new Message();
		msg.setMessage((String)ob.get("content"));
		msg.setSender((String)ob.get("senderId"));
		msg.setChatroom_id((String)ob.get("chatroomId"));
		msg.setSend_time((String)ob.get("sendTime"));
		service.createMessage(msg);
	}
	
	@OnClose
	public void handleDisconnection(Session userSession) {
		System.out.println("client is now disconnected...");
		if (configs.containsKey(userSession)) {
			configs.remove(userSession);
		}
		
		User user = getUser(userSession);
		if (user != null) {
			sessionUsers.remove(user);
		}
	}
	
	@OnError
	public void handleError(Throwable e) {
		e.printStackTrace();
	}
	
	public static void sendMessage(String key, String message) throws IOException {
	}
}