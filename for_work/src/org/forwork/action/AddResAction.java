package org.forwork.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.ScrumBoardService;

public class AddResAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward af = new ActionForward();
		ScrumBoardService service = ScrumBoardService.getInstance();
		int result = service.addResService(request);
		PrintWriter out = response.getWriter();
		if(result == 1){
			out.print("success");
		}else {
			out.print("false");			
		}
		return null;
	}

}
