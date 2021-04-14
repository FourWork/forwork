package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.service.BoardService;

public class InsertBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		Board board = new Board();
		board.setProject_id(Integer.parseInt(request.getParameter("project_id")));
		board.setBoard_name(request.getParameter("board_name"));
		
		service.insertBoardService(board);
		
		forward.setRedirect(true);
		forward.setPath("listAction.do");
		
		return forward;
	}

}
