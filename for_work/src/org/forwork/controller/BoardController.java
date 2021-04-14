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
import org.forwork.action.BoardMainAction;
import org.forwork.action.DeletePostAction;
import org.forwork.action.DetailPostAction;
import org.forwork.action.InsertBoardAction;
import org.forwork.action.InsertBoardFormAction;
import org.forwork.action.InsertPostAction;
import org.forwork.action.InsertPostFormAction;
import org.forwork.action.ListAction;
import org.forwork.action.UpdatePostAction;
import org.forwork.action.UpdatePostFormAction;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardController() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();

		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length() + 7);
		System.out.println(command);
		
		Action action = null;
		ActionForward forward = null;
		
		if (command.equals("insertBoard.do")) {
			action = new InsertBoardFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("insertPost.do")) {
			action = new InsertPostFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		} else if (command.equals("insertBoardAction.do")) {
			action = new InsertBoardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("insertPostAction.do")) {
			action = new InsertPostAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("listAction.do")) {
			action = new ListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("boardMainAction.do")) {
			action = new BoardMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("detailAction.do")) {
			action = new DetailPostAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("updatePostFormAction.do")) {
			action = new UpdatePostFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("updatePostAction.do")) {
			action = new UpdatePostAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("deletePostAction.do")) {
			action = new DeletePostAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispacher = request.getRequestDispatcher(forward.getPath());
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
