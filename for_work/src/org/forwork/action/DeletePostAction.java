package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.BoardService;

public class DeletePostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		
		service.deletePostService(post_id);
		
		forward.setRedirect(true);
		forward.setPath("listAction.do?project_id=" + project_id + "&board_id=" + board_id);
		
		return forward;
	}

}
