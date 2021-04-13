package org.forwork.domain;

public class Task {
	private String task_id;
	private String project_id;
	private String task_type_id;
	private String responsibility;
	private String writer;
	private String task_content;
	
	public Task() {}

	public Task(String task_id, String project_id, String task_type_id, String responsibility, String writer,
			String task_content) {
		super();
		this.task_id = task_id;
		this.project_id = project_id;
		this.task_type_id = task_type_id;
		this.responsibility = responsibility;
		this.writer = writer;
		this.task_content = task_content;
	}

	public String getTask_id() {
		return task_id;
	}

	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getTask_type_id() {
		return task_type_id;
	}

	public void setTask_type_id(String task_type_id) {
		this.task_type_id = task_type_id;
	}

	public String getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTask_content() {
		return task_content;
	}

	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}



	
}
