package org.forwork.controller;

import java.util.HashMap;
import java.util.List;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;
import org.forwork.service.PortfolioService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/MyProfile/")
@RestController
@Log4j
@AllArgsConstructor
public class PortfolioController {

	private PortfolioService service;
	
	@PostMapping(value="/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody HashMap<Portfolio, List<PortfolioLanguage>> map){
		log.info("Portfolio-PfLang MAP: "+map);
		Portfolio portfolio= map.keySet().iterator().next();
		List<PortfolioLanguage> pfLang=map.values().iterator().next();
		
		int insertCount = service.register(portfolio, pfLang);
		
		return insertCount==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping(value = "/member_id/{member_id}",
			produces={
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Portfolio>> getList(@PathVariable("member_id") String member_id){
		log.info("-------------Controller_GetList------------");
		return new ResponseEntity<List<Portfolio>>(service.getList(member_id),HttpStatus.OK);
	}
	
}
