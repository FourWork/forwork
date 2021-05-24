package org.forwork.service.PMPage;

import java.util.List;

import org.forwork.domain.Project;
import org.forwork.domain.TeamProgress;
import org.forwork.mapper.PMPageMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class PMPageServiceImpl implements PMPageService {
	
	private PMPageMapper mapper;

	@Override
	public TeamProgress getColumCount(int project_id) {

		log.info("GET COLUMN COUNT....!!!/ project_id: "+project_id);
		
		return mapper.getColumCount(project_id);
	}

	@Override
	public List<TeamProgress> getPersonalCount(int project_id) {
		
		log.info("GET PERSONAL COUNT / project_id: "+project_id);
		
		return mapper.getPersonalCount(project_id);
	}

	@Override
	public List<TeamProgress> getPersonalTasks(int project_id, int responsibility) {

		log.info("GET PERSONAL TASKS" +"project_id: "+project_id +"responsibility: " + responsibility);
		return mapper.getPersonalTasks(project_id, responsibility);
	}

	@Override
	public List<Project> getProjects() {
		
		log.info("GET PROJECTS.........!!!");
		return mapper.getProjects();
	}
	
	


	
	



}
