package com.oracle.BlockBuster.controller;


import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oracle.BlockBuster.service.loginCheck;

@Controller
public class loginController {

	private static final Logger logger = LoggerFactory.getLogger(loginController.class);

	@Autowired
	private loginCheck loginCheck; // sessionId 받아오는 모듈

	
//	 @GetMapping(value="login") 
//	 public String login() {
//		 logger.info("[*-1] loginForm 시작");
//
//		 return "loginForm"; 
//	 }
	 

	@PostMapping("loginCheck")
	public String login(String id, String password, HttpServletRequest request) throws Exception {

		// ID와 PW 검증
		if (!loginCheck.loginCheck(id, password)) {

			// 불일치 시, 메세지 띄우고 재로그인
			String error = URLEncoder.encode("ID 또는 PW가 일치하지 않습니다.", "UTF-8");
			return "redirect:/login?error=" + error;
		}

		// 일치 시, 입력받은 id를 세션에 저장해서 메인으로
		HttpSession session = request.getSession();
		session.setAttribute("sessionId", id); //id인지 member인지 확인 필요

		return "forward:/main";

	}

}
