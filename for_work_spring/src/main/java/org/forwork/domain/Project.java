package org.forwork.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Project {
	
	private String project_id;
	private String project_title;
	private String project_status_id;
	private String project_start_date;
	private String project_end_date;

}
