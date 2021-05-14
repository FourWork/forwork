package org.forwork.service;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Task;
import org.forwork.mapper.TaskMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class TaskServiceImpl implements TaskService {
	

	private TaskMapper mapper;

	@Override
	public int insertTask(Task task) {
		
		log.info("INSERT TASK.....!!!!" + task);
		
		return mapper.insertTask(task);
	}

	@Override
	public List<Task> listTask() {
		
		log.info("GET TASK LIST.....!!!!" );
		
		return mapper.listTask();
	}

	@Override
	public int deleteTask(int task_id) {

		log.info("DELETE TASK.....!!!!" + task_id);
		
		return mapper.deleteTask(task_id);
	}

	@Override
	public int updateTask(Task task) {

		log.info("UPDATE TASK.....!!!!" + task);
		
		return mapper.updateTask(task);
	}

	@Override
	public Task detailTask(int task_id) {

		log.info("DETAIL TASK.....!!!!" + task_id);
		
		return mapper.detailTask(task_id);
	}

	@Override
	@Transactional
	public int moveTask(Map<String, String> changeData) {
		log.info("move task : " + changeData.toString());
		Task task = mapper.detailTask(Integer.parseInt(changeData.get("task_id")));
		System.out.println("previdx : " + changeData.get("previdx"));
		System.out.println("getTask_type_id : " + task.getTask_type_id());
		System.out.println("col_name : " +  changeData.get("col_name"));
		
		mapper.decreaseUpdate(changeData.get("previdx"), task.getTask_type_id());
		
		String type_id = null;
		switch (changeData.get("col_name")) {
			case "Stories":
				type_id = "1";break;
			case"To-Do":
				type_id = "2";break;
			case"Doing":
				type_id = "3";break;
			case"Done":
				type_id = "4";break;
			default:break;
		}
		System.out.println("type_id  :  " + type_id);
		mapper.increaseUpdate(changeData.get("nowidx"), type_id);
		
		task.setTask_index(changeData.get("nowidx"));
		task.setTask_type_id(type_id);
		log.info("update task : " + task);
		return mapper.moveTask(task);
	}

	@Override
	@Transactional
	public int addRes(String task_id, String name) {
		Task task = mapper.detailTask(Integer.parseInt(task_id));
		task.setResponsibility(name);
		return mapper.updateTask(task);
	}

}
