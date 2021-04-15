package org.forwork.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Sprint;
import org.forwork.domain.Task;
import org.forwork.mapper.ScrumBoardMapper;




public class ScrumBoardDao {
	
	private static ScrumBoardDao dao = new ScrumBoardDao();
	
	public static ScrumBoardDao getInstance() {
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory() { //sqlSession
		String resource = "mybatis-config.xml";
		InputStream in = null;
		
		try {
			in = Resources.getResourceAsStream(resource); // mybatis-config.xml에 inputStream연결 하는 것
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
		return list;
	}
	
	
	
	public int insertTask(Task task) {
		int re= -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ScrumBoardMapper.class).insertTask(task); //insertBoard는 Board.xml의 id명과 일치시킴(메서드명을 id명과 일치시켜야함)
			if(re>0) {
				sqlSession.commit(); // commit을 꼭 해줘야 함
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
	
	
	public int updateTask(Task task) {
		int re= -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ScrumBoardMapper.class).updateTask(task);
			if(re>0) {
				sqlSession.commit(); // commit을 꼭 해줘야 함
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
	
	
	public Task detailTask(int task_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Task task = new Task();
		try {
			task = sqlSession.getMapper(ScrumBoardMapper.class).detailTask(task_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession !=null) {
				sqlSession.close();
			}
			
		}
		return task;
	}
	
	
	public int deleteTask(int task_id) {
		int re= -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			re = sqlSession.getMapper(ScrumBoardMapper.class).deleteTask(task_id); 
			if(re>0) {
				sqlSession.commit(); // insert, update, delete는 commit을 꼭 해줘야 함
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
	
	public int getStoriesIndex() {
		int result = -1;
		
		SqlSession session = getSqlSessionFactory().openSession();
		
		try {
			result = session.getMapper(ScrumBoardMapper.class).getStoriesIndex();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return result;
	}
	
	public Task getTask(String task_id) {
		Task task = null;
		SqlSession session = getSqlSessionFactory().openSession();
		
		try {
			task = session.getMapper(ScrumBoardMapper.class).getTask(task_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return task;
	}
	
	public int moveTask(Task task) {
		int result = -1;
		
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			result = session.getMapper(ScrumBoardMapper.class).moveTask(task);
			if(result == 1) {
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
	
	public int increaseIndex(Task task) {
		int result = -1;
		
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			result = session.getMapper(ScrumBoardMapper.class).increaseIndex(task);
			if(result >= 0) {
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
	
	public int decreaseIndex(Task task) {
		int result = -1;
		
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			result = session.getMapper(ScrumBoardMapper.class).decreaseIndex(task);
			if(result >= 0) {
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
	
	public int addRes(Task task) {
		int result = -1;
		
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			result = session.getMapper(ScrumBoardMapper.class).addRes(task);
			if(result == 1 ) {
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
	
	
	
	//Sprint CRUD
	
		public int insertSprint(Sprint sprint) {
			int re = -1;
			SqlSession sqlSession = getSqlSessionFactory().openSession();
			try {
				re = sqlSession.getMapper(ScrumBoardMapper.class).insertSprint(sprint);
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
		
		public List<Sprint> listSprint(){
			SqlSession sqlSession = getSqlSessionFactory().openSession();
			List<Sprint> list = null;
			try {
				list = sqlSession.getMapper(ScrumBoardMapper.class).listSprint();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(sqlSession != null) {
					sqlSession.close();
				}
			}
			
			return list;
		}
}
