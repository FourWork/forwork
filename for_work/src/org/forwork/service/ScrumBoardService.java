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
			int result_update = dao.updateTask(task);
			
			result = dao.increaseIndex(task);
			if(result_update == 1) {
				
			}
		}
		return result;
	}


}
