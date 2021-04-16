package org.forwork.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.forwork.domain.Board;
import org.forwork.domain.Post;
import org.forwork.mapper.BoardMapper;


public class BoardDao {

	private static BoardDao dao = new BoardDao();
	
	public static BoardDao getInstance() {
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
	
	public int insertBoard(Board board) {
		int re = -1;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(BoardMapper.class).insertBoard(board);
			
			if(re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	public int insertPost(Post post) {
		int re = -1;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(BoardMapper.class).insertPost(post);
			
			if(re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	// 게시판 별 게시글 목록
	public List<Post> listPost(int board_id) {
		List<Post> list = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			list = sqlSession.getMapper(BoardMapper.class).listPost(board_id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	// 게시판 메뉴 목록
	public List<Board> listBoardMenu(int project_id) {
		List<Board> list = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			list = sqlSession.getMapper(BoardMapper.class).listBoardMenu(project_id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertNoticeBoard(int project_id) {
		int re = -1;
		
		List<Board> list = listBoardMenu(project_id);

		if (list.size() == 0) {

			try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
				re = sqlSession.getMapper(BoardMapper.class).insertNoticeBoard(project_id);

				if (re > 0) {
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return re;
		} else {
			return 0;
		}
	}

	public int insertDefaultBoard(int project_id) {
		int re = -1;

		List<Board> list = listBoardMenu(project_id);
		
		System.out.println("insertDefaultBoard : "+list.size());
		
		if (list.size() == 1) {

			try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
				re = sqlSession.getMapper(BoardMapper.class).insertDefaultBoard(project_id);

				if (re > 0) {
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return re;
		} else {
			return 0;
		}
	}
	
	public int selectDefaultBoard(int project_id) {
		int board_id = 0;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			board_id = sqlSession.getMapper(BoardMapper.class).selectDefaultBoard(project_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board_id;
	}
	
	// 게시판 홈: 공지 사항 미리 보기
	public List<Post> listNotice(int project_id) {
		List<Post> list = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			list = sqlSession.getMapper(BoardMapper.class).listNotice(project_id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 게시판 홈: 최신 글 목록
	public List<Post> listBoard(int project_id) {
		List<Post> list = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			list = sqlSession.getMapper(BoardMapper.class).listBoard(project_id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Post detailPost(int post_id) {
		Post post = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			post = sqlSession.getMapper(BoardMapper.class).detailPost(post_id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public Board boardName(int board_id) {
		Board board = null;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			board = sqlSession.getMapper(BoardMapper.class).boardName(board_id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int updatePost(Post post) {
		int re = -1;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(BoardMapper.class).updatePost(post);
			
			if(re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int deletePost(int post_id) {
		int re = -1;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(BoardMapper.class).deletePost(post_id);
			
			if(re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}

	public int updateBoard(Board board) {
		int re = -1;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(BoardMapper.class).updateBoard(board);
			
			if(re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int deleteBoard(int board_id) {
		int re = -1;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(BoardMapper.class).deleteBoard(board_id);
			
			if(re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public int updateHitcount(int post_id) {
		int re = -1;
		
		try (SqlSession sqlSession = getSqlSessionFactory().openSession();) {
			re = sqlSession.getMapper(BoardMapper.class).updateHitcount(post_id);
			
			if(re > 0) {
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
