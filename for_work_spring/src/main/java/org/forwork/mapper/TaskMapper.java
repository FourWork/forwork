package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Task;

public interface TaskMapper {

	public int insertTask(Task task);

	public List<Task> listTask();

	public int deleteTask(int task_id);

	public int updateTask(Task task);
	
	public Task detailTask(int task_id);
	
}
