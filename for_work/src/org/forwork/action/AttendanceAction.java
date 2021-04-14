package org.forwork.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.forwork.dto.WeekAttendance;
import org.forwork.service.AttendanceService;

public class AttendanceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward af = new ActionForward();
		HttpSession session = request.getSession();
		AttendanceService service = AttendanceService.getInstance();
		if(session != null) {
			Map<String, String> res = service.getTimeService(request);
			
			if(res != null) {
				session.setAttribute("commute",res.get("commute"));
				session.setAttribute("off", res.get("off"));
			}
			List<WeekAttendance> li = service.getWeekAttendanceService(request);
			request.setAttribute("week", li);
		}
		af.setRedirect(false);
		af.setPath("/views/attendance.jsp");
		return af;
	}

}
