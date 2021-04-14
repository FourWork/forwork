package org.forwork.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Member;
import org.forwork.mapper.MemberMapper;

public class MemberDAO {
	private static MemberDAO dao = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream in = null;
		
		try {
			in = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new SqlSessionFactoryBuilder().build(in);
		
	}	
	
	public int insertMember(Member member) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(MemberMapper.class).insertMember(member);
			if(re>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return re;
	}
	
	/*
	 * public int readMember(Member member) {
	 * 
	 * SqlSession sqlSession = getSqlSessionFactory().openSession(); Member member =
	 * null; try { member =
	 * sqlSession.getMapper(MemberMapper.class).readMember(member); } catch
	 * (Exception e) { e.printStackTrace(); }finally { if(sqlSession != null) {
	 * sqlSession.close(); } }
	 * 
	 * return member; }
	 */
	
	
}
	
	