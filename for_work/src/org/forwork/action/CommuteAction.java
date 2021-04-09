package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.AttendanceService;

public class CommuteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward af = new ActionForward();
		AttendanceService service = AttendanceService.getInstance();
		service.commuteService(request);
		af.setPath("/for_work/attendance/");
		af.setRedirect(true);
		return af;
	}

}
