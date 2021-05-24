package org.forwork.controller.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/project")
@AllArgsConstructor
public class ProjectController {
	
	@GetMapping("list")
	public String loginSuccess(){
		
		return "project/list";
	}

}
