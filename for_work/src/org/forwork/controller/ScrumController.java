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
import org.forwork.action.DeleteTaskAction;
import org.forwork.action.InsertTaskAction;
import org.forwork.action.MoveTaskAction;
import org.forwork.action.scrumBoardAction;


@WebServlet("/task/*")
public class ScrumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScrumController() {
        super();
    }
    
    public void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();

    	String command = requestURI.substring(contextPath.length()+6);
    	
    	Action action = null;  
		ActionForward forward = null;
		
		if(command.equals("scrumBoard.do")) {
		
			action = new scrumBoardAction(); 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
			
		
		else if(command.equals("insertTaskAction.do")) {
	
			action = new InsertTaskAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		else if(command.equals("deleteTaskAction.do")) {
			action = new DeleteTaskAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("moveTask.do")) {
			action = new MoveTaskAction();
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
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
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
