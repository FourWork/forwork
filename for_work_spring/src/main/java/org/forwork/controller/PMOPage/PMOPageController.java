package org.forwork.controller.PMOPage;


import java.util.List;

import org.forwork.domain.Portfolio;
import org.forwork.domain.Project;
import org.forwork.dto.PMODto;
import org.forwork.service.PMOPage.PMOPageService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/PMOpage/")
@RestController
@Log4j
@AllArgsConstructor
public class PMOPageController {
	private PMOPageService service;
	
	@GetMapping(value = "/{project_id}/status_id",
			produces={
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PMODto> getStatusId(@PathVariable("project_id") String project_id){

		return new ResponseEntity<PMODto>(service.getProject(project_id),HttpStatus.OK);
	}
	
}
