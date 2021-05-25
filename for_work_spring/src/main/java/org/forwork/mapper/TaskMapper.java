package org.forwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.forwork.domain.Project;
import org.forwork.domain.Task;

public interface TaskMapper {

	public int insertTask(Task task);

	public List<Task> listTask();

	public int deleteTask(int task_id);

	public int updateTask(Task task);
	
	public Task detailTask(int task_id);
	
	public int increaseUpdate(@Param("task_index")String idx,@Param("task_type_id")String type_id );
	
	public int decreaseUpdate(@Param("task_index")String idx,@Param("task_type_id")String type_id );
	
	public int moveTask(Task task);
	
	public int addResponsibility(Task task);
	
	public int getSprint(int task_id);
	
<<<<<<< HEAD
	public Project getPr(int project_id);
=======
	public int maxIndex();
>>>>>>> branch 'master' of https://github.com/FourWork/forwork.git
}
