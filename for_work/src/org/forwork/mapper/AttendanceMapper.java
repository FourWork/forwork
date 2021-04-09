package org.forwork.mapper;

import java.util.Map;

import org.forwork.domain.Member;

public interface AttendanceMapper {
	int commute(String member_id);
	int check(String member_id);
	Map<String, String> getTime(String member_id);
	int off(String member_id);
}
