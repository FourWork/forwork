
package org.forwork.socket;


import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;

@Controller
@ServerEndpoint(value = "/taskSocket") // socket connection url
@Log4j
public class TaskWebSocketServer {
	//추가 사항 : project별로 구분 필요 
	private static final List<Session> sessionList = new ArrayList<>(); // 연결된 세션 모음
	
	public TaskWebSocketServer() { // websocket 생성
		System.out.println("web socket create");
	}
	
	
	@OnOpen
	public void onOpen(Session session){ 
		log.info("open session : " + session.getId());
		try{ // 정상적으로 연결시 메세지 전달
			final Basic basic = session.getBasicRemote();
			basic.sendText("연결 완료");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}
	
	private void sendAllSessionToMessage(Session self,String msg){ // 모든 session의 유저에게 메세지 전달 broadCast
		try {
			for(Session s : TaskWebSocketServer.sessionList){
				if(!self.getId().equals(s.getId())){
					s.getBasicRemote().sendText("c");
				}
			}
		} catch (Exception e) {
			log.info(e.getMessage());
		}
	}
	
	
	@OnMessage // 메세지 전달시
	public void onMessage (String message, Session session){
		try {
			//메세지 보낸 사람에게 표시될 내용
			final Basic basic = session.getBasicRemote();
			basic.sendText("변경하였습니다.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// 다른 사람에게 메세지 보내기
		sendAllSessionToMessage(session,message); // 전달 받은 메세지 broad cast
	}
	
	@OnError
	public void onError(Throwable e, Session session){
		log.info(e.getMessage() + "by session : " + session.getId());
	}
	@OnClose
	public void onClose(Session session){
		log.info("Session : "+ session.getId() + " closed");
		sessionList.remove(session); // 연결 종료 시 session 삭제
	}
}