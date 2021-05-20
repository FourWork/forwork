package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.service.BoardService;

public class InsertPostFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));

		Board board = service.boardNameService(board_id);
		List<Board> boardMenu = service.listBoardMenuService(project_id);
		
		request.setAttribute("project_id", project_id);
		request.setAttribute("board_id", board_id);
		request.setAttribute("board", board);
		request.setAttribute("boardMenu", boardMenu);
		
		forward.setRedirect(false);
		forward.setPath("/views/insertPost.jsp");
		
		return forward;
	}

}
