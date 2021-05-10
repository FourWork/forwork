package org.forwork.controller;

import java.util.Map;

import org.forwork.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/attendance/*")
@Log4j
public class AttendanceController {
	@Setter(onMethod_=@Autowired)
	private AttendanceService service;
	@GetMapping("/main")
	public String getAttendance(Model model){
		Map<String, String> map = service.getTime("2");
		model.addAttribute("time", map);
		return "attendance";
	}
}
