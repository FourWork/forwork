package org.forwork.service;

import java.util.Map;

public interface AttendanceService {
	public int commuteRegister(String member_id);
	public int offRegister(String member_id);
	public Map<String, String> getTime(String member_id);
}
