package org.forwork.domain;

import java.io.Serializable;

public class Sprint implements Serializable {
	private String sprint_id;
	private String sprint_title;
	private String sprint_color;
	private String project_id;
	private String sprint_start_date;
	private String sprint_end_date;
	
	public Sprint() {}

	public Sprint(String sprint_id, String sprint_title, String sprint_color, String project_id,
			String sprint_start_date, String sprint_end_date) {
		super();
		this.sprint_id = sprint_id;
		this.sprint_title = sprint_title;
		this.sprint_color = sprint_color;
		this.project_id = project_id;
		this.sprint_start_date = sprint_start_date;
		this.sprint_end_date = sprint_end_date;
	}

	public String getSprint_id() {
		return sprint_id;
	}

	public void setSprint_id(String sprint_id) {
		this.sprint_id = sprint_id;
	}

	public String getSprint_title() {
		return sprint_title;
	}

	public void setSprint_title(String sprint_title) {
		this.sprint_title = sprint_title;
	}

	public String getSprint_color() {
		return sprint_color;
	}

	public void setSprint_color(String sprint_color) {
		this.sprint_color = sprint_color;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getSprint_start_date() {
		return sprint_start_date;
	}

	public void setSprint_start_date(String sprint_start_date) {
		this.sprint_start_date = sprint_start_date;
	}

	public String getSprint_end_date() {
		return sprint_end_date;
	}

	public void setSprint_end_date(String sprint_end_date) {
		this.sprint_end_date = sprint_end_date;
	}
	
	

}
