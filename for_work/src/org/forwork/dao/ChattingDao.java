package org.forwork.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.ChatroomMemberRelation;
import org.forwork.domain.Message;
import org.forwork.mapper.ChattingMapper;

public class ChattingDao {
	private static ChattingDao dao = new ChattingDao();
	
	public static ChattingDao getInstance() {
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFacotry() {
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
		SqlSession session = getSqlSessionFacotry().openSession();
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
		SqlSession session = getSqlSessionFacotry().openSession();
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
}
