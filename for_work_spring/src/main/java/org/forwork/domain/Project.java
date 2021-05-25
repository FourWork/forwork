package org.forwork.domain;

import java.awt.List;
import java.io.Serializable;
import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Project implements Serializable{
	
	private String project_id;
	private String project_title;
	private String pmo_id;
	private String pm_id;
	private String pa_id;
	private String project_status_id;
	private String project_start_date;
	private String project_end_date;
	

}
