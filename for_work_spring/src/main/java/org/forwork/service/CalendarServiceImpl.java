package org.forwork.service;

import java.util.List;

import org.forwork.domain.Calendar;
import org.forwork.mapper.CalendarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Setter(onMethod_=@Autowired)
	private CalendarMapper mapper;
	
	@Override
	public int registerCalendar(Calendar cal) {
		return mapper.insertCalendar(cal);
	}

	@Override
	public List<Calendar> listCalendar(String project_id) {
		return mapper.getCalendarList(project_id); // 가져오는 값 dto로 변경하기!
	}

}
