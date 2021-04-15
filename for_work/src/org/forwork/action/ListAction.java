package org.forwork.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.domain.Board;
import org.forwork.domain.Post;
import org.forwork.service.BoardService;

public class ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardService service = BoardService.getInstance();
		
		int project_id = Integer.parseInt(request.getParameter("project_id"));	
		
		// 새 프로젝트에 자동으로 공지 사항, 기본 게시판 생성
		service.insertinsertNoticeBoard(project_id);
		service.insertDefaultBoard(project_id);
		
		int board_id;
		
		// board_id 값 없으면 기본 게시판으로 이동
		if (request.getParameter("board_id") == null || request.getParameter("board_id").equals("")) {
			board_id = service.selectDefaultBoardService(project_id);
		} else {
			board_id = Integer.parseInt(request.getParameter("board_id"));
		}
		
//		ListModel listModel = service.listPostService(board_id);
		List<Board> boardMenu = service.listBoardMenuService(project_id); 
		List<Post> list = service.listPostService(board_id);
		Board boardName = service.boardNameService(board_id);
		request.setAttribute("boardMenu", boardMenu);
		request.setAttribute("boardName", boardName);
		request.setAttribute("list", list);
		
		forward.setRedirect(false);
		
		//forward.setPath("/views/boardList.jsp?project_id=" + project_id + "&board_id=" + board_id);
		forward.setPath("/views/boardList.jsp");
		return forward;
	}

}
