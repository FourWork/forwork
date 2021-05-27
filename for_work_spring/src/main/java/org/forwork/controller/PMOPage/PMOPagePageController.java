package org.forwork.controller.PMOPage;

import org.forwork.service.PMOPage.PMOPageService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Controller
@RequestMapping(value="/PMOpage/*",produces=MediaType.TEXT_HTML_VALUE)
public class PMOPagePageController {
	
	private PMOPageService service;
	
	@GetMapping("/main")
	public void main(Model model){
		model.addAttribute("list_approved", service.getList("2"));
		model.addAttribute("list_not_yet_approved", service.getList("1"));
	}
	
	@GetMapping("/get")
	public void get(Model model, @RequestParam("project_id")String project_id){
		System.out.println("......ok");
		model.addAttribute("project_id", project_id);
		model.addAttribute("memberList", service.getMemberList(project_id));	
		model.addAttribute("project", service.getProject(project_id));
		model.addAttribute("timeline", service.getProjectTimeline(project_id));
	}
	

}
