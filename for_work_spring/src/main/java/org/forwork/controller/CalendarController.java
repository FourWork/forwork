package org.forwork.controller;

import java.util.List;

import org.forwork.domain.Calendar;
import org.forwork.service.CalendarService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CalendarController {
	
	private CalendarService service;
	
	@PostMapping(value="/calendar/add",consumes="application/json")
	public ResponseEntity<String> addCalendar(@RequestBody Calendar cal){
		if(service.registerCalendar(cal)==1){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<String>("fail",HttpStatus.OK);
	}
	
	@GetMapping(value="/calendar/get/{project_id}",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Calendar>> getCalendarList(@PathVariable("project_id")String project_id){
		List<Calendar> list = null;
		list = service.listCalendar(project_id);
		return new ResponseEntity<List<Calendar>>(list,HttpStatus.OK);
	}
}
