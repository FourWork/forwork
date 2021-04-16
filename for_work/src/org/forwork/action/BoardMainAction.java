package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.domain.Post;
import org.forwork.service.BoardService;


public class BoardMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int project_id = Integer.parseInt(request.getParameter("project_id"));

		// 새 프로젝트에 자동으로 공지 사항, 기본 게시판 생성
		service.insertinsertNoticeBoard(project_id);
		service.insertDefaultBoard(project_id);
		
		List<Board> boardMenu = service.listBoardMenuService(project_id); 
		List<Post> noticePre = service.listNoticeService(project_id);
		List<Post> boardList = service.listBoardService(project_id);
		
		request.setAttribute("noticePre", noticePre);
		request.setAttribute("boardList", boardList);
		request.setAttribute("boardMenu", boardMenu);
		
		forward.setRedirect(false);
		forward.setPath("/views/boardMain.jsp?project_id=" + project_id);
		
		System.out.println("mainAction.do 실행");
		
		return forward;
	}

}
