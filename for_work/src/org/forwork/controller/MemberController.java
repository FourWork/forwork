package org.forwork.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.action.ActionForward;
import org.forwork.action.MemberAction;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public MemberController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
public void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	//URL 식별
	//http://localhost:8081/MVC/board/updateBoard.do  => 문자열 부분추출
	String requestURI = request.getRequestURI();
	
	//->/MVC/board/updateBoard.do
	String contextPath = request.getContextPath();
	
	String command = requestURI.substring(contextPath.length()+8);
	System.out.println("최종요청: " + command);
	
	MemberAction action = null;
	ActionForward forward = null;
	
	if(command.equals("login.do")) {
 		action = new MemberAction();
 		try {
 				forward = action.loginPage(request, response);
 			} catch (Exception e) {
 				e.printStackTrace();
 		}
 	}else if(command.equals("insertAction.do")) {
 		action = new MemberAction();
 		try {
 				forward = action.execute(request, response);
 			} catch (Exception e) {
 				e.printStackTrace();
 		}
 		
 	}else if(command.equals("join.do")) {
 		action = new MemberAction();
 		try {
 				forward = action.joinPage(request, response);
 			} catch (Exception e) {
 				e.printStackTrace();
 		}
 	}
		/*
		 * if(command.equals("loginAction.do")) { action = new MemberAction(); try { forward =
		 * action.execute(request, response); } catch (Exception e) {
		 * e.printStackTrace(); }
		 * 
		 * }
		 */
	if(forward != null) {
		if(forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		}else {
			RequestDispatcher dispacher =
					request.getRequestDispatcher(forward.getPath());
			 dispacher.forward(request, response);
		}
	}	
}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}