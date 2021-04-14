package org.forwork.mapper;

import java.util.List;
import java.util.Map;

import org.forwork.domain.Member;
import org.forwork.dto.WeekAttendance;

public interface AttendanceMapper {
	int commute(String member_id);
	int check(String member_id);
	Map<String, String> getTime(String member_id);
	int off(String member_id);
	List<WeekAttendance> getWeekAttendance(Map<String,Integer> map);
}
