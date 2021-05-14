package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Sprint;

public interface SprintMapper {
	
	public int insertSprint(Sprint sprint);
	
	public List<Sprint> listSprint();
	
	public Sprint getSprint(int sprint_id);
	
	public int deleteSprint(int sprint_id);
	
	public int updateSprint(Sprint sprint);
}
