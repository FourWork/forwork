package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.BoardService;


public class DeleteBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		service.deleteBoardService(board_id);
		
		forward.setRedirect(true);
		forward.setPath("boardManagerAction.do?project_id=" + project_id);
		
		return forward;
	}

}
