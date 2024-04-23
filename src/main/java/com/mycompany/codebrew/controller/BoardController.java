package com.mycompany.codebrew.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@RequestMapping("/boardList")
	public String boardList() {
		log.info("실행");
		return "board/boardList";
	}
	@RequestMapping("/boardDetail")
	public String boardDetail() {
		log.info("실행");
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardRegister")
	public String boardRegister() {
		log.info("실행");
		return "board/boardRegister";
	}
	
	
}

