package org.forwork.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Task;
import org.forwork.mapper.ScrumBoardMapper;

public class ScrumBoardDao {
	
	private static ScrumBoardDao dao = new ScrumBoardDao();
	
	public static ScrumBoardDao getInstance() {
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
	

	public List<Task> listTask(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Task> list = null;
		try {
			list = sqlSession.getMapper(ScrumBoardMapper.class).listTask();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession != null) {
				sqlSession.close();
			}
		}
		System.out.println(list);
		return list;
	}
	
	
	
	public int insertTask(Task task) {
		int re= -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ScrumBoardMapper.class).insertTask(task); 
			if(re>0) {
				sqlSession.commit(); 
			}else {
				sqlSession.rollback();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession !=null) {
				sqlSession.close();
			}
		}
		
		
		return re;
	}
	
	
	public int deleteTask(int seq) {
		int re= -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ScrumBoardMapper.class).deleteTask(seq); 
			if(re>0) {
				sqlSession.commit(); 
			}else {
				sqlSession.rollback();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession !=null) {
				sqlSession.close();
			}
		}

		return re;
	}

}