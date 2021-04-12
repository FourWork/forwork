package org.forwork.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.forwork.dao.AttendanceDAO;
import org.forwork.dto.WeekAttendance;

public class AttendanceService {
	private static AttendanceService service = new AttendanceService();
	private static AttendanceDAO dao;
	
	public static AttendanceService getInstance() {
		dao = AttendanceDAO.getInstance();
		return service;
	}
	
	public int commuteService(HttpServletRequest request) throws Exception{
		int result = -1;
		HttpSession session = request.getSession();
		if (session.getAttribute("member_id") != null) {
			int member_id = (int)session.getAttribute("member_id");
			int check = dao.check(member_id+"");
			System.out.println(check);
			if (check == 0) {

				result = dao.commute(member_id+"");
	
			}
		}
		return result;
	}
	
	public int offService(HttpServletRequest request) throws Exception{
		int result = -1;
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {
			int member_id = (int)session.getAttribute("member_id");
			Map<String, String> res =dao.getTime(member_id+"");
			if(res.get("off").equals(""))
				result = dao.off(member_id+"");
		}
		return result;
	}
	
	public List<WeekAttendance> getWeekAttendanceService(HttpServletRequest request) throws Exception{
		List<WeekAttendance> li = null;
		HttpSession s = request.getSession();
		if(s.getAttribute("member_id") != null) {
			int member_id = (int)s.getAttribute("member_id");
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("member_id", member_id);
			map.put("ago",0);
			li = dao.getWeekAttendance(map);
		}
		
		return li;
	}
	
	public Map<String, String> getTimeService(HttpServletRequest request) throws Exception{
		Map<String, String> result = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {
			int member_id = (int)session.getAttribute("member_id");
			result = dao.getTime(member_id+"");
		}
		return result;
	}
}
