package org.forwork.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Member;
import org.forwork.mapper.AttendanceMapper;

public class AttendanceDAO {
	private static AttendanceDAO dao = new AttendanceDAO();
	
	public static AttendanceDAO getInstance() {
		return dao;
	}
	
	public int commute(String member_id) {
		SqlSession session = getSqlSessionFacotry().openSession();
		int result = -1;
		try {			
			result = session.getMapper(AttendanceMapper.class).commute(member_id);
			
			if(result > 0) {
				session.commit();
			}else {
				session.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return result;
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
	
}
