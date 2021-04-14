package org.forwork.domain;

import java.io.Serializable;

public class Project implements Serializable {
	private String project_id;
	private String project_title;
	private String project_start_date;
	private String project_end_date;
	private String pm_id;
	private String project_status_id;
	
	public Project() {}

	public Project(String project_id, String project_title, String project_start_date, String project_end_date,
			String pm_id, String project_status_id) {
		super();
		this.project_id = project_id;
		this.project_title = project_title;
		this.project_start_date = project_start_date;
		this.project_end_date = project_end_date;
		this.pm_id = pm_id;
		this.project_status_id = project_status_id;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_title() {
		return project_title;
	}

	public void setProject_title(String project_title) {
		this.project_title = project_title;
	}

	public String getProject_start_date() {
		return project_start_date;
	}

	public void setProject_start_date(String project_start_date) {
		this.project_start_date = project_start_date;
	}

	public String getProject_end_date() {
		return project_end_date;
	}

	public void setProject_end_date(String project_end_date) {
		this.project_end_date = project_end_date;
	}

	public String getPm_id() {
		return pm_id;
	}

	public void setPm_id(String pm_id) {
		this.pm_id = pm_id;
	}

	public String getProject_status_id() {
		return project_status_id;
	}

	public void setProject_status_id(String project_status_id) {
		this.project_status_id = project_status_id;
	}
	
	
	
}
