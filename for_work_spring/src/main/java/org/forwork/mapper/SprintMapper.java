package org.forwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.forwork.domain.Sprint;

public interface SprintMapper {
	
	public int insertSprint(Sprint sprint);
	
	public List<Sprint> listSprint();
	
	public Sprint getSprint(int sprint_id);
	
	public int deleteSprint(int sprint_id);
	
	public int updateSprint(Sprint sprint);
	
	public int todaySprint(String project_id);
	
	public int addTaskSprintRelation(@Param("task_id") String task_id, @Param("sprint_id")String sprint_id);
}
