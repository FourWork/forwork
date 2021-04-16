package org.forwork.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.ScrumBoardService;

public class MoveTaskAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ScrumBoardService service = ScrumBoardService.getInstance();
		int res = service.moveTaskService(request);
		PrintWriter out = response.getWriter();
		if(res >= 0) {
			out.print("success");
		}else {
			out.print("fail");
		}
		

		return null;
	}

}
