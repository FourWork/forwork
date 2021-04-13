package org.forwork.service;

import javax.servlet.http.HttpServletRequest;
import org.forwork.dao.MemberDAO;
import org.forwork.domain.Member;

public class MemberService {
	private static MemberService service = new MemberService();
	private static MemberDAO dao;
	
	public static MemberService getInstance() {
		dao = MemberDAO.getInstance();
		return service;
	}
	
	public int insertMemberService(HttpServletRequest request)throws Exception{
		request.setCharacterEncoding("utf-8");
		
		
		Member member = new Member();
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setPw(request.getParameter("pw"));
		
		
		
		
		return dao.insertMember(member);
	}
	
	/*
	 * public int readMemberService(HttpServletRequest request)throws Exception{
	 * request.setCharacterEncoding("utf-8");
	 * 
	 * 
	 * Member member = new Member(); member.setEmail(request.getParameter("email"));
	 * member.setPw(request.getParameter("pw"));
	 * 
	 * 
	 * 
	 * 
	 * return dao.readMember(member); }
	 */
}