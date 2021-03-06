package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Sprint;
import org.forwork.domain.Task;


public interface ScrumBoardMapper {
	int insertTask(Task task);
	List<Task> listTask();
	int deleteTask(int task_id);
	int updateTask(Task task);
	Task detailTask(int task_id);
	int getStoriesIndex();
	Task getTask(String task_id);
	int moveTask(Task task);
	int increaseIndex(Task task);
	int decreaseIndex(Task task);
	int addRes(Task task);
	int insertSprint(Sprint sprint);
	List<Sprint> listSprint();
}
