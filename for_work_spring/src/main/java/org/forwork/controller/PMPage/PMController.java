package org.forwork.controller.PMPage;

import java.util.List;

import org.forwork.domain.Project;
import org.forwork.domain.TeamProgress;
import org.forwork.service.PMPage.PMPageService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/pmPage/")
@RestController
@Log4j
@AllArgsConstructor
public class PMController {
	
	private PMPageService service;
	
	@GetMapping(value="/{project_id}/getColumnPr", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TeamProgress> getTeamProgress(@PathVariable("project_id") int project_id){
		
		log.info("GET COLUMN COUNT....!");
		
		return new ResponseEntity<>(service.getColumCount(project_id), HttpStatus.OK);
	}
	
	@GetMapping(value="/{project_id}", produces={MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<TeamProgress>> getPersonalCount(@PathVariable("project_id") int project_id){
		
		log.info("GET PERSONAL COUNT...!" +"project_id: "+ project_id);
		
		return new ResponseEntity<>(service.getPersonalCount(project_id),HttpStatus.OK);
				
	}
	
	@GetMapping(value="/getTasks/{project_id}/{responsibility}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<TeamProgress>> getPersonalTasks(@PathVariable("project_id") int project_id,@PathVariable("responsibility")int responsibility){
		
		log.info("GET PERSONAL TASKS...!"+"project_id: "+ project_id+" responsibility: " + responsibility );
		
		return new ResponseEntity<>(service.getPersonalTasks(project_id,responsibility),HttpStatus.OK);
	}
	
	@GetMapping(value="/PrSelect", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Project>> getProjects(){
		
		log.info("GET PROJECTS...!!!");
		
		return new ResponseEntity<>(service.getProjects(),HttpStatus.OK);
	}

}
