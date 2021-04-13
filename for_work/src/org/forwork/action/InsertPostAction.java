package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Post;
import org.forwork.service.BoardService;

public class InsertPostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
			
		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		Post post = new Post();
		post.setBoard_id(board_id);
		post.setPost_writer(request.getParameter("post_writer"));
		post.setPost_title(request.getParameter("post_title"));
		post.setPost_content(request.getParameter("post_content"));
		post.setPost_file("");
		
		service.insertPostService(post);
		
		forward.setRedirect(true);
		forward.setPath("listAction.do?project_id=" + project_id + "&board_id=" + board_id);
		
		return forward;
	}

}
