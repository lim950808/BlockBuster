package com.oracle.BlockBuster.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.BlockBuster.service.MainService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	public MainService ms;
	
	// main페이지 시작
	@GetMapping(value = "main")
	public String main() {
		logger.info("main 시작");
		return "main";
	}
	// main페이지 끝.
	
	@GetMapping(value = "home")
	public String home() {
		logger.info("home 시작");
		return "home";
	}
	
	
	// 조병훈님, header 시작 부분---------------------------------------------
	@GetMapping(value="header1")
	public String header1() {
		logger.info("상단 header1"); 
		return "header1";
	}
	// 조병훈님, header 끝 부분---------------------20220127 ver.------------


	// 조병훈님, menu 시작
	@GetMapping(value = "menu")
	public String menu() {
		logger.info("상단 menu");
		return "menu";
	}
	// 조병훈님, menu 끝.	
		
		
	// 김성휘님, footer 시작 부분----------------------------------------------
	
	@GetMapping(value="introduce")
	public String introduce() {
		logger.info("introduce 회사소개 페이지"); //김성휘님 담당 - img ref. : logo.png, 이외 개인 캐릭터사진 예정...
		return "introduce";
	}
	
	@GetMapping(value="serviceInt")
	public String serviceInt() {
		logger.info("serviceInt 서비스 소개 페이지"); //김동현님 담당 - img ref. : logo.png, logo2.png, Review.png, Rroducts.png
		return "serviceInt";
	}
	@GetMapping(value="policy")
	public String policy() {
		logger.info("policy 이용약관 페이지"); //이창빈님 담당 - img ref. : 없음
		return "policy";
	}
	@GetMapping(value="privacy")
	public String privacy() {
		logger.info("privacy 개인정보보호정책 페이지"); //이창빈님 담당 - img ref. : 없음
		return "privacy";
	}
	
	
	// 김성휘님, footer 끝 부분--------------------------20220127 ver.----------
}
