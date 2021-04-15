package org.forwork.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Chatroom;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Member;
import org.forwork.domain.Message;
import org.forwork.mapper.ChattingMapper;

public class ChattingDao {
	private static ChattingDao dao = new ChattingDao();
	
	public static ChattingDao getInstance() {
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory() {
		String res = "mybatis-config.xml";
		InputStream in = null;
		
		try {
			in = Resources.getResourceAsStream(res);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(in);
	}
	
	public List<ChatroomMemberRelation> getChatroomMemberRelation() {
		SqlSession session = getSqlSessionFactory().openSession();
		List<ChatroomMemberRelation> result = null;
		try {
			result = session.getMapper(ChattingMapper.class).getChatroomMemberRelation();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return result;
	}
	
	public void insertMessage(Message message) {
		SqlSession session = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = session.getMapper(ChattingMapper.class).insertMessage(message);
			if (re > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}
	
	public List<Message> getMessageByChatroomId(String chatroomId){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Message> messages = null;
		try {
			messages = session.getMapper(ChattingMapper.class).getMessageByChatroomId(chatroomId);
			System.out.println(messages);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return messages;
	}
	
	public List<Chatroom> getChatroomByMemberId(String memberId){
		SqlSession session = getSqlSessionFactory().openSession();
		List<Chatroom> chatrooms = null;
		try {
			chatrooms = session.getMapper(ChattingMapper.class).getChatroomByMemberId(memberId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return chatrooms;
	}
	
	public Member getMemberById(String memberId) {
		SqlSession session = getSqlSessionFactory().openSession();
		Member member = null;
		try {
			member = session.getMapper(ChattingMapper.class).getMemberById(memberId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return member;
	}
}
