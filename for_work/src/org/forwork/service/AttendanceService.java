package org.forwork.service;

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
		int result;
		AttendanceDAO dao = AttendanceDAO.getInstance();
		result = dao.commute(request.getParameter("member_id"));
		
		return result;
	}
	
}
