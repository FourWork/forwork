package org.forwork.mapper;

import java.util.List;

import org.forwork.domain.Member;
import org.forwork.dto.PMODto;

public interface PMOPageMapper {
	
	public int update(PMODto dto);
	public List<PMODto> getProjectList(String project_status_id);
	public PMODto getProject(String project_id);
	public List<Member> getMemberList(String project_id);
	public PMODto getProjectTimeline(String project_id);
}
