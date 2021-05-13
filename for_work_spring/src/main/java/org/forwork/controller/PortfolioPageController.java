package org.forwork.controller;

import org.forwork.domain.Portfolio;
import org.forwork.domain.PortfolioLanguage;
import org.forwork.service.BoardService;
import org.forwork.service.PortfolioService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/MyProfile/*", 
produces=MediaType.TEXT_HTML_VALUE)
public class PortfolioPageController {

	@GetMapping("/main")
	public String main(){
		return "/MyProfile/main";
	}
	
	

}
