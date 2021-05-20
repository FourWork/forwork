package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.service.BoardService;


public class UpdateBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();

		int project_id = Integer.parseInt(request.getParameter("project_id"));
		
		Board board = new Board();
		board.setProject_id(project_id);
		board.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
		board.setBoard_name(request.getParameter("board_name"));
		
		service.updateBoardService(board);
		
		forward.setRedirect(true);
		forward.setPath("boardManagerAction.do?project_id=" + project_id);
		
		return forward;
	}

}
