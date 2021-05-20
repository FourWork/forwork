package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.service.BoardService;


public class BoardManagerAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		List<Board> boardMenu = service.listBoardMenuService(project_id);
		
		request.setAttribute("boardMenu", boardMenu);
		request.setAttribute("project_id", project_id);
		
		forward.setRedirect(false);
		forward.setPath("/views/boardManager.jsp");
		
		return forward;
	}

}
