package com.oracle.BlockBuster.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.BlockBuster.model.Member;
import com.oracle.BlockBuster.service.DHService;

@Controller
public class DHController {
	
	@Autowired
	private DHService ds;
	
	private static final Logger logger = LoggerFactory.getLogger(DHController.class);
	
	//내정보 조회
	@GetMapping(value = "/member/myinfo")
	public String myinfo(HttpSession session, Model model) {
		System.out.println("DHController myinfo Start...");
		String id = (String) session.getAttribute("sessionId");
		System.out.println("DHController myinfo id->"+id);
		Member member = ds.memberDetail(id);
		System.out.println("DHController myinfo member.getNickname()->"+member.getNickname());
		model.addAttribute("member",member);
		return "/member/myinfo";
	}
	
	
	//회원수정페이지
	@GetMapping(value = "/member/memberModifyForm")
	public String modifyForm(HttpSession session, Model model) {
		System.out.println("DHController modifyForm Start...");
		String id = (String) session.getAttribute("sessionId");
		System.out.println("DHController modifyForm id->" + id);
		Member member = ds.memberDetail(id);
		model.addAttribute("member", member);
		return "/member/memberModifyForm";
	}
	
	//비밀번호만 변경
	@GetMapping(value = "/member/passwordModifyForm")
	public String passwordModifyForm(HttpSession session, Model model) {
		System.out.println("DHController passwordModifyForm Start...");
		String id = (String) session.getAttribute("sessionId");
		System.out.println("DHController passwordModifyForm id->"+id);
		Member member = ds.memberDetail(id);
		model.addAttribute("member", member);
		return "/member/passwordModifyForm";
	}
	
	
	@PostMapping(value ="/member/memberUpdate")
	public String memberUpdate(Member member, Model model) {
		System.out.println("DHController memberUpdate Start...");
	//	System.out.println("DHController memberUpdate before member.getId()->"+member.getId());
	//	System.out.println("DHController memberUpdate before member.getNickname()->"+member.getNickname());
	//	System.out.println("DHController memberUpdate before member.getPassword()->"+member.getPassword());
		int uptCnt = ds.memberUpdate(member);
		System.out.println("ds.memberUpdate(member) Count-->"+uptCnt);
		model.addAttribute("uptCnt",uptCnt);
	//	System.out.println("DHController memberUpdate after member.getId()->"+member.getId());
	//	System.out.println("DHController memberUpdate after member.getNickname()->"+member.getNickname());
	//	System.out.println("DHController memberUpdate after member.getPassword()->"+member.getPassword());
	//	model.addAttribute("member", member);
		return "/member/myinfo";
	}//회원수정 끝
	
	
	//회원삭제 DELSTATUS(탈퇴여부) : 일반회원 0(Default), 탈퇴회원1
	@RequestMapping(value = "/member/memberDelete")
	public String memberDelete(HttpSession session, Model model) {
		System.out.println("DHController memberDelete Start...");
		String id = (String) session.getAttribute("sessionId");
		int result = ds.memberDelete(id);  
		System.out.println("memberDelete result-->"+result);//탈퇴회원1
		return "redirect:/welcome";
	}
	
	
	//닉네임 중복확인 없으면 0 있으면 1
	@RequestMapping(value = "/member/nickNameChk")
	@ResponseBody
	public String nickNameChk(String nickname, Model model) {
		System.out.println("DHController nickNameChk Start...");
		int result = ds.nickNameChk(nickname);
		System.out.println("nickNameChk result -->"+result);
		String nickNameChk = String.valueOf(result);
		return nickNameChk;
	}
	
	
	//이메일 중복확인 없으면 0 있으면 1
	@RequestMapping(value = "/member/emailChk")
	@ResponseBody
	public String emailChk(String email, Model model) {
		System.out.println("DHController emailChk Start...");
		int result = ds.emailChk(email);
		System.out.println("emailChk result -->"+result);
		String emailChk = String.valueOf(result);
		return emailChk;
	}	
}
