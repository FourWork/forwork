package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Project;

public interface PMOMapper {

	public List<Project> getProjectList(String project_status_id);
	
}
