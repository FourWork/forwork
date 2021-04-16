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
import org.forwork.action.AllTodolistAction;
import org.forwork.action.DeleteAllDonelistAction;
import org.forwork.action.DeleteTodolistAction;
import org.forwork.action.InsertTodolistAction;
import org.forwork.action.UpdateDonelistAction;


@WebServlet("/main/*")
public class TodolistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TodolistController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();

		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length() + 6);
		System.out.println(command);

		Action action = null;
		ActionForward forward = null;

		if (command.equals("allTodolistAction.do")) {
			action = new AllTodolistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("updateDonelistAction.do")) {
			action = new UpdateDonelistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("deleteTodolistAction.do")) {
			action = new DeleteTodolistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("deleteAllDonelistAction.do")) {
			action = new DeleteAllDonelistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("insertTodolistAction.do")) {
			action = new InsertTodolistAction();
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
