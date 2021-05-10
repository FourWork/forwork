package org.forwork.service;

import java.util.Map;

import org.forwork.mapper.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Setter(onMethod_=@Autowired)
	private AttendanceMapper mapper;
	
	@Override
	public int commuteRegister(String member_id) {
		return mapper.commute(member_id);
	}

	@Override
	public int offRegister(String member_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, String> getTime(String member_id) {
		return mapper.getTime(member_id);
	}

}
