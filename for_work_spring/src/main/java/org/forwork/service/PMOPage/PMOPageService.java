package org.forwork.service.PMOPage;

import java.util.List;

import org.forwork.domain.Project;

public interface PMOPageService {

	public List<Project> getList(String project_status_id);
}
