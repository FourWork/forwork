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
import org.forwork.action.InsertPortfolioAction;
import org.forwork.action.InsertPortfolioFormAction;
import org.forwork.action.ListPortfolioAction;

/**
 * Servlet implementation class PortfolioController
 */
@WebServlet("/Portfolio/*")
public class PortfolioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PortfolioController() {
        super();
    }


	public void doProcess(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{

		String requestURI = request.getRequestURI();
		String contextPath =request.getContextPath();
		
		String command = requestURI.substring(contextPath.length()+11);
		
		
		Action action = null;
		ActionForward forward= null;

		if(command.contentEquals("listPortfolioAction.do")) {
			action = new ListPortfolioAction();
			try {
				forward =action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.contentEquals("insertPortfolioAction.do")){
		action = new InsertPortfolioAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}else if(command.contentEquals("insertPortfolioFormAction.do")){
		action = new InsertPortfolioFormAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
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
