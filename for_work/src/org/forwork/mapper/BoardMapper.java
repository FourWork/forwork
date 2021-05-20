package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Board;
import org.forwork.domain.Post;

public interface BoardMapper {

	int insertBoard(Board board);
	int insertPost(Post post);
//	int countPost(Search search, RowBounds rowbounds);
	List<Post> listPost(int board_id);
	List<Board> listBoardMenu(int project_id);
	int insertNoticeBoard(int project_id);
	int insertDefaultBoard(int project_id);
	int selectDefaultBoard(int project_id);
	
	List<Post> listNotice(int project_id);
	List<Post> listBoard(int project_id);
	
	Post detailPost(int post_id);
	Board boardName(int board_id);
	
	int updatePost(Post post);
	int deletePost(int post_id);
	int updateBoard(Board board);
	int deleteBoard(int board_id);
	
	int updateHitcount(int post_id);
	
}
