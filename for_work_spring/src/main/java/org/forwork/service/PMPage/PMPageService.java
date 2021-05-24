package org.forwork.service.PMPage;

import java.util.List;

import org.forwork.domain.Project;
import org.forwork.domain.TeamProgress;

public interface PMPageService {
	
	public TeamProgress getColumCount(int project_id);
	public List<TeamProgress> getPersonalCount(int project_id);
	public List<TeamProgress> getPersonalTasks(int project_id,int responsibility);
	public List<Project> getProjects();


}
