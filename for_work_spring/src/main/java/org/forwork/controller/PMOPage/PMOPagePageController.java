package org.forwork.controller.PMOPage;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/PMOpage/*",produces=MediaType.TEXT_HTML_VALUE)
public class PMOPagePageController {
	
	
	@GetMapping("/main")
	public String main(){
		System.out.println("ok....");
		
		return "PMOpage/main";
		//return "PMpage/hello";
	}
}
