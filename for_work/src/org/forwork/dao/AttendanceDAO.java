package org.forwork.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Member;
import org.forwork.dto.WeekAttendance;
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
	
	public int check(String member_id) {
		SqlSession session = getSqlSessionFacotry().openSession();
		int result = 0;
		try {
			result = session.getMapper(AttendanceMapper.class).check(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return result;
	}
	
	public int off(String member_id) {
		SqlSession session = getSqlSessionFacotry().openSession();
		int result = -1;
		try {
			result = session.getMapper(AttendanceMapper.class).off(member_id);
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
	public Map<String, String> getTime(String member_id) {
		SqlSession session = getSqlSessionFacotry().openSession();
		
		Map<String, String> result = null;
		try {
			result = session.getMapper(AttendanceMapper.class).getTime(member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return result;
	}
	
	public List<WeekAttendance> getWeekAttendance(Map<String, Integer> map){
		List<WeekAttendance> wa = null;
		SqlSession session = getSqlSessionFacotry().openSession();
		
		try {
			wa = session.getMapper(AttendanceMapper.class).getWeekAttendance(map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return wa;
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
