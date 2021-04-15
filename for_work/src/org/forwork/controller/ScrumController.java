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
import org.forwork.action.DetailDeleteAction;
import org.forwork.action.DetailUpdateAction;
import org.forwork.action.InsertTaskAction;
import org.forwork.action.UpdateTaskAction;
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
    	
    	Action action = null;  // 한 번만 선언해서 각각 다른 action으로 형변환하여 쓸 수 있게 하는 것
		ActionForward forward = null;
		
		if(command.equals("scrumBoard.do")) {
			// 페이지 이동
			action = new scrumBoardAction(); // 이 부분의 코드 구조는 같고 실행 파일만 다름-> 코드의 일관성
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		
		else if(command.equals("insertTaskAction.do")) {
			// DB에 데이터 저장
			// 페이지"insertTaskAction.do"로 이동
			action = new InsertTaskAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		else if(command.equals("detailDeleteAction.do")) {
			action = new DetailDeleteAction();
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
		
		else if(command.equals("detailUpdateAction.do")) {
			action = new DetailUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("updateTaskAction.do")) {
			action = new UpdateTaskAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else { // isRedirect가 false일 때
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
