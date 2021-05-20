package org.forwork.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Todolist;
import org.forwork.mapper.TodolistMapper;

public class TodolistDao {

	private static TodolistDao dao = new TodolistDao();

	public static TodolistDao getInstance() {
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

	public int insertTodolist(Todolist todolist) {
		int re = -1;

		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(TodolistMapper.class).insertTodolist(todolist);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public List<Todolist> selectTodolist(int member_id) {
		List<Todolist> list = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			list = sqlSession.getMapper(TodolistMapper.class).selectTodolist(member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int updateDonelist(int todolist_id) {
		int re = -1;

		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(TodolistMapper.class).updateDonelist(todolist_id);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public List<Todolist> selectDoinglist(int member_id) {
		List<Todolist> list = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			list = sqlSession.getMapper(TodolistMapper.class).selectDoinglist(member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(list);
		
		return list;
	}
	
	public List<Todolist> selectDonelist(int member_id) {
		List<Todolist> list = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			list = sqlSession.getMapper(TodolistMapper.class).selectDonelist(member_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(list);
		
		return list;
	}
	
	public int deleteTodolist(int todolist_id) {
		int re = -1;

		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(TodolistMapper.class).deleteTodolist(todolist_id);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int deleteAllDonelist(int member_id) {
		int re = -1;

		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(TodolistMapper.class).deleteAllDonelist(member_id);

			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
}
