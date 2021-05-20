package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.domain.Post;
import org.forwork.service.BoardService;

public class UpdatePostFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		Post post = service.detailPostService(post_id);
		Board board = service.boardNameService(board_id);
		List<Board> boardMenu = service.listBoardMenuService(project_id);
		
		request.setAttribute("post", post);
		request.setAttribute("board", board);
		request.setAttribute("boardMenu", boardMenu);
		request.setAttribute("project_id", project_id);
		
		forward.setRedirect(false);
		forward.setPath("/views/updatePost.jsp");
		
		return forward;
	}

}
