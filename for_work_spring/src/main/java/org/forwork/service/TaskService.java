package org.forwork.service;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Task;

public interface TaskService {

	public int insertTask(Task task);

	public List<Task> listTask();

	public int deleteTask(int task_id);

	public int updateTask(Task task);

	public Task detailTask(int task_id);
	
	public int moveTask(Map<String, String> changeData);
}
