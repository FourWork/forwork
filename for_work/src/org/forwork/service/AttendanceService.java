package org.forwork.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.forwork.dao.AttendanceDAO;

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
		AttendanceDAO dao = AttendanceDAO.getInstance();
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
		AttendanceDAO dao = AttendanceDAO.getInstance();
		if(session.getAttribute("member_id") != null) {
			int member_id = (int)session.getAttribute("member_id");
			result = dao.off(member_id+"");
		}
		return result;
	}
	public Map<String, String> getTimeService(HttpServletRequest request) throws Exception{
		Map<String, String> result = null;
		HttpSession session = request.getSession();
		AttendanceDAO dao = AttendanceDAO.getInstance();
		if(session.getAttribute("member_id") != null) {
			int member_id = (int)session.getAttribute("member_id");
			result = dao.getTime(member_id+"");
		}
		return result;
	}
}
