package org.forwork.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.forwork.domain.Project;
import org.forwork.domain.TeamProgress;

@Mapper
public interface PMPageMapper {
	
	public TeamProgress getColumCount(int project_id);
	public List<TeamProgress> getPersonalCount(int project_id);
	public List<TeamProgress> getPersonalTasks(@Param("project_id")int project_id,@Param("responsibility")int responsibility);
	public List<Project> getProjects();

}
