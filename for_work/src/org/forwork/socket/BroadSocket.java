package org.forwork.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.service.ChattingService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@ServerEndpoint(value = "/broadsocket", configurator = HttpSessionConfigurator.class)
public class BroadSocket {
	private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());

	// TODO: DB에 저장된 정보(user-chatroom-relation) 불러와서 넣은 리스트 만들기
	// TODO: socket session 연결(OnOpen)이랑 연결 끊는 부분(OnClose) 수정하기
	private static List<ChatroomMemberRelation> chatroomMemberRelations = Collections.synchronizedList(new ArrayList<>());
	private static List<User> sessionUsers = Collections.synchronizedList(new ArrayList<>());
	
	private ChattingService service = ChattingService.getInstance();

	private class User {
		Session session;
		String userId;
	}
	
//	private class Message {
//		String content;
//		String sender;
//		String sendTime;
//		String chatroomId;
//		
//	}
	
	// TODO: 여기서 DB 내용을 바로 가져오는게 아니라 chatroom-member-relation 테이블이 수정되면 이 함수만 call하도록 수정 
	public void setChatroomMemberRelations() {
		chatroomMemberRelations.clear();
		List<ChatroomMemberRelation> results = service.getChatroomMemberRelationService();
		for(ChatroomMemberRelation result: results) {
			chatroomMemberRelations.add(result);
			System.out.println(result);
		}
	}

	public User getUser(Session userSession) {
		Optional<User> op = sessionUsers.stream().filter(x -> x.session == userSession).findFirst();
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public User getUser(String userId) {
		Optional<User> op = sessionUsers.stream().filter(x -> x.userId.equals(userId)).findFirst();
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
		
//		Message msg = new Message();
//		msg.content = (String)ob.get("content");
//		msg.sender = (String)ob.get("sender");
//		msg.chatroomId = (String)ob.get("chatroomId");
//		msg.sendTime = (String)ob.get("sendTime");
		
		// TODO: 보내기를 원하는 유저들의 user_id 찾기
		String chatroomId = (String)ob.get("chatroomId");
		List<String> sendingUserIds = new ArrayList<String>();
		for(ChatroomMemberRelation relation: chatroomMemberRelations) {
			if (relation.getChatroom_id().equals(chatroomId)) {
				sendingUserIds.add(relation.getUser_id());
				System.out.println(sendingUserIds);
			}
		}
		
		for(String sendingUserId: sendingUserIds) {
			User sendTo = getUser(sendingUserId);
			System.out.println("sdfsdfsdfNulll");
			System.out.println(sendTo.userId);
			// 자기랑 연결된 소켓에 보낼때는 그냥 send
			sendTo.session.getBasicRemote().sendText(ob.toJSONString());
		}
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
