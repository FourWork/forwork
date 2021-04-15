package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.service.BoardService;


public class UpdateBoardFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		Board board = service.boardNameService(board_id);
		
		request.setAttribute("board", board);
		
		forward.setRedirect(false);
		forward.setPath("/views/updateBoard.jsp");
		
		return forward;
	}

}
