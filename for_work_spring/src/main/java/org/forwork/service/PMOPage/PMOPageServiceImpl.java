package org.forwork.service.PMOPage;

import java.util.List;

import org.forwork.domain.Project;
import org.forwork.mapper.MyProfileMapper;
import org.forwork.mapper.PMOMapper;
import org.forwork.service.myprofile.MyProfileServiceImpl;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class PMOPageServiceImpl implements PMOPageService{

	private PMOMapper mapper;
	
	@Override
	public List<Project> getList(String project_status_id) {

		return(mapper.getProjectList(project_status_id));
	}


	
}
