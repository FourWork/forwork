package org.forwork.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.forwork.dao.ScrumBoardDao;
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
		
		Task task = new Task();
		task.setTask_content(request.getParameter("task_content"));
		
		System.out.println(task.getTask_content());
		
		return dao.insertTask(task);
	}

	public List<Task> listScrumBoardService()throws Exception{
		List<Task> list = dao.listTask();
		
		return list;
	}
	
	public int deleteTaskService(HttpServletRequest request)throws Exception{
		return dao.deleteTask(Integer.parseInt(request.getParameter("seq")));
		
	}


}
