package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Post;
import org.forwork.service.BoardService;

public class UpdatePostFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		
		Post post = service.detailPostService(post_id);
		request.setAttribute("post", post);
		
		forward.setRedirect(false);
		forward.setPath("/views/updatePost.jsp");
		
		return forward;
	}

}
