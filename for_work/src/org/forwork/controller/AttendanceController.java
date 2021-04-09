package org.forwork.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.forwork.action.Action;
import org.forwork.action.ActionForward;
import org.forwork.action.AttendanceAction;
import org.forwork.action.CommuteAction;

/**
 * Servlet implementation class AttendanceController
 */
@WebServlet("/attendance/*")
public class AttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AttendanceController() {
        super();
  
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String url = request.getRequestURI();
    	url = url.substring(request.getContextPath().length());
    	Action action = null;
    	ActionForward af = null;
    	if(url.equals("/attendance/")) {
    		action = new AttendanceAction();
    	}else if(url.equals("/attendance/commute")){
    		action = new CommuteAction();
    	}
    	try {
    		if(action != null) {
			af = action.execute(request, response);
    		}
			if(af != null) {
				if(af.isRedirect()) {
					response.sendRedirect(af.getPath());
				}else {
					RequestDispatcher dis = request.getRequestDispatcher(af.getPath());
					dis.forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
