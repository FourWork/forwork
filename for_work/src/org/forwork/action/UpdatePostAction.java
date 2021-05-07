package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Post;
import org.forwork.service.BoardService;


public class UpdatePostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();

		int project_id = Integer.parseInt(request.getParameter("project_id"));
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		Post post = new Post();
		post.setPost_id(post_id);
		post.setBoard_id(board_id);
		post.setPost_title(request.getParameter("post_title"));
		post.setPost_content(request.getParameter("post_content"));
		
		service.updatePostService(post);
		
		forward.setRedirect(true);
		forward.setPath("detailAction.do?post_id=" + post_id + "&board_id=" + board_id + "&project_id=" + project_id);
		
		return forward;
	}

}
