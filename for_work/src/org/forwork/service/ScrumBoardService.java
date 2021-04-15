package org.forwork.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.forwork.dao.MemberDAO;
import org.forwork.dao.ScrumBoardDao;
import org.forwork.domain.Member;
import org.forwork.domain.Task;


public class ScrumBoardService {
	private static ScrumBoardService service = new ScrumBoardService();
	private static ScrumBoardDao dao;
	
	public static ScrumBoardService getInstance() {
		dao = ScrumBoardDao.getInstance();
		return service;
	}
	
	public int insertTaskService(HttpServletRequest request)throws Exception{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("name");
		Task task = new Task();
		if(writer != null){
			task.setWriter(writer);
		}
		task.setTask_content(request.getParameter("task_content"));
		task.setTask_index(dao.getStoriesIndex()+1);
		
		
		return dao.insertTask(task);
	}

	public List<Task> listScrumBoardService()throws Exception{
		List<Task> list = dao.listTask();
		
		return list;
	}
	
	public int deleteTaskService(HttpServletRequest request)throws Exception{
		return dao.deleteTask(Integer.parseInt(request.getParameter("task_id")));
		
	}
	
	public int updateTaskService(Task task)throws Exception{

		return dao.updateTask(task);
	}
	
	public Task detailTaskService(HttpServletRequest request)throws Exception{
		Task task = dao.detailTask(Integer.parseInt(request.getParameter("task_id")));
		
		return task;
		
	}
	
	public int moveTaskService(HttpServletRequest request)throws Exception{
		int result = 0;
		request.setCharacterEncoding("utf-8");
		String task_id = request.getParameter("task_id");
		Task task = dao.getTask(task_id);
		String type_id = null;
		if(request.getParameter("col_name") != null) {
			switch (request.getParameter("col_name")) {
			case "Stories":
					type_id = "1";
				break;
			case"To-do":
				type_id = "2";
				break;
			case"Doing":
				type_id = "3";
				break;
			case"Done":
				type_id = "4";
				break;
			default:
				break;
			}
		}
		
		if(task != null) {
			result = dao.decreaseIndex(task);
			
			task.setTask_type_id(type_id);
			task.setTask_index(Integer.parseInt(request.getParameter("nowidx")));
			int result_update = dao.moveTask(task);
			
			result = dao.increaseIndex(task);
			if(result_update == 1) {
				
			}
		}
		return result;
	}

	public int addResService(HttpServletRequest request) throws Exception{
		int result = -1;
		HttpSession session = request.getSession();
		Task task = dao.getTask(request.getParameter("task_id"));
		if(task != null) {
			if(session.getAttribute("name")!=null) {
				String m_name = (String)session.getAttribute("name");
				String m_id = (String)session.getAttribute("member_id");
				task.setResponsibility(m_id);
				task.setName(m_name);
				result = dao.addRes(task);
			}
		}
		return result;
	}

}
