package org.forwork.service;

import java.util.List;

import org.forwork.domain.Task;
import org.forwork.mapper.TaskMapper;
import org.springframework.stereotype.Service;

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

}
