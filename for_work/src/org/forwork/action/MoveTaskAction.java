package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.ScrumBoardService;

public class MoveTaskAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward af = new ActionForward();
		ScrumBoardService service = ScrumBoardService.getInstance();
		int res = service.moveTaskService(request);
//		if(res >= 0) {
//			System.out.println("성공");
//		}else {
//			System.out.println("실패");
//		}
		
		af.setPath("");
		af.setRedirect(true);
		return af;
	}

}
