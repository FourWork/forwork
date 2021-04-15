package org.forwork.service;

import java.util.List;

import org.forwork.dao.BoardDao;
import org.forwork.domain.Board;
import org.forwork.domain.Post;

public class BoardService {
	private static BoardService service = new BoardService();
	private static BoardDao dao;
	
	public static BoardService getInstance() {
		dao = BoardDao.getInstance();
		return service;
	}
	
	public int insertBoardService(Board board) throws Exception {
		return dao.insertBoard(board);
	}
	
	public int insertPostService(Post post) throws Exception {
		return dao.insertPost(post);
	}
	
	public List<Post> listPostService(int board_id) throws Exception {
		return dao.listPost(board_id);
	}
	
	public List<Board> listBoardMenuService(int project_id) throws Exception {
		return dao.listBoardMenu(project_id);
	}
	
	public int insertinsertNoticeBoard(int project_id) throws Exception {
		return dao.insertNoticeBoard(project_id);
	}
	
	public int insertDefaultBoard(int project_id) throws Exception {
		return dao.insertDefaultBoard(project_id);
	}
	
	public int selectDefaultBoardService(int project_id) throws Exception {
		return dao.selectDefaultBoard(project_id);
	}
	
	public List<Post> listNoticeService(int project_id) throws Exception {
		return dao.listNotice(project_id);
	}

	public List<Post> listBoardService(int project_id) throws Exception {
		return dao.listBoard(project_id);
	}
	
	public Post detailPostService(int post_id) throws Exception {
		return dao.detailPost(post_id);
	}
	
	public Board boardNameService(int board_id) throws Exception {
		return dao.boardName(board_id);
	}
	
	public int updatePostService(Post post) throws Exception {
		return dao.updatePost(post);
	}
	
	public int deletePostService(int post_id) throws Exception {
		return dao.deletePost(post_id);
	}

	public int updateBoardService(Board board) throws Exception {
		return dao.updateBoard(board);
	}
	
	public int deleteBoardService(int board_id) throws Exception {
		return dao.deleteBoard(board_id);
	}
	
	public int updateHitcountService(int post_id) throws Exception {
		return dao.updateHitcount(post_id);
	}
}
