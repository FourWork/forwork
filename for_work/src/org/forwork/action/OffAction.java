package org.forwork.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.service.AttendanceService;

public class OffAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward af = new ActionForward();
		AttendanceService service = AttendanceService.getInstance();
		System.out.println("실행");
		service.offService(request);
		af.setPath("/for_work/attendance/");
		af.setRedirect(true);
		return af;
	}

}
