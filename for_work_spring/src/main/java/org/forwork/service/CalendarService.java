package org.forwork.service;

import java.util.List;

import org.forwork.domain.Calendar;

public interface CalendarService {
	public int registerCalendar(Calendar cal);
	public List<Calendar> listCalendar(String project_id);
}
