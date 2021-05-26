package org.forwork.service;

import java.util.List;

import org.forwork.domain.Calendar;
import org.forwork.dto.CalendarDto;

public interface CalendarService {
	public int registerCalendar(Calendar cal);
	public List<CalendarDto> listCalendar(String project_id);
	
	public int updateCalendar(Calendar cal);
}
