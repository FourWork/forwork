package org.forwork.controller;

import org.forwork.service.ChattingService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RequestMapping("/chatting/*")
@AllArgsConstructor
@RestController
public class ChattingController {

	private final ChattingService serivce;
	
	
}
