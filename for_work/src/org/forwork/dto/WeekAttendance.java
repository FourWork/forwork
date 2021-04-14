package org.forwork.dto;

import java.io.Serializable;

public class WeekAttendance implements Serializable {
	private String week;
	private String commute;
	private String off;
	
	public WeekAttendance() {
		
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getCommute() {
		return commute;
	}

	public void setCommute(String commute) {
		this.commute = commute;
	}

	public String getOff() {
		return off;
	}

	public void setOff(String off) {
		this.off = off;
	}

	public WeekAttendance(String week, String commute, String off) {
		super();
		this.week = week;
		this.commute = commute;
		this.off = off;
	}
}
