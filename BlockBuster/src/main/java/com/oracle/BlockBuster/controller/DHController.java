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

import com.oracle.BlockBuster.model.JJMember;
import com.oracle.BlockBuster.model.Member;
import com.oracle.BlockBuster.service.DHService;

@Controller
public class DHController {
	
	@Autowired
	private DHService ds;
	
	private static final Logger logger = LoggerFactory.getLogger(DHController.class);
	
//	//내정보 조회
//	@GetMapping(value = "/member/myinfo")
//	public String myinfo(String id, Model model) {
//		System.out.println("JKController myinfo start...");
//		System.out.println("JKController myinfo id->"+id);
//		Member member = ds.memberDetail(id);
//		System.out.println("JKController myinfo member.getNickname()->"+member.getNickname());
//		model.addAttribute("member",member);
//		
//		return "/member/myinfo";
//	}
	
	//내정보 조회
	@GetMapping(value = "/member/myinfo")
	public String myinfo(HttpSession session, Model model) {
		System.out.println("JKController myinfo start...");
//		System.out.println("JKController myinfo id->"+id);
		String id = (String) session.getAttribute("sessionId");
		Member member = ds.memberDetail(id);
		System.out.println("JKController myinfo member.getNickname()->"+member.getNickname());
		model.addAttribute("member",member);
		
		return "/member/myinfo";
	}
	
	
	
	//회원수정
	@GetMapping(value = "/member/memberModifyForm")
	public String modifyForm(String id, Model model) {
		System.out.println("JKController JKModifyForm start...");
		System.out.println("JKController JKModifyForm id->" + id);
		Member member = ds.memberDetail(id);
		model.addAttribute("member", member);
		
		return "/member/memberModifyForm";
	}
	@PostMapping(value ="/member/memberUpdate")
	public String memberUpdate(Member member, Model model) {
		System.out.println("JKController MemberUpdate start...");
		int uptCnt = ds.memberUpdate(member);
		System.out.println("jks.MemberUpdate(member) Count-->"+uptCnt);
		model.addAttribute("uptCnt",uptCnt);
		
		return "/member/myinfo";
	}//회원수정 끝
	
	
	//회원삭제 DELSTATUS(탈퇴여부) : 일반회원 0(Default), 탈퇴회원1
	@RequestMapping(value = "/member/memberDelete")
	public String memberDelete(String id, Model model) {
		System.out.println("JKController MemberDelete start...");
		int result = ds.memberDelete(id);  
		System.out.println("MemberDelete result-->"+result);//탈퇴회원1
		return "redirect:/member/welcome";
	}
	
	/*
	//닉네임 체크
	@GetMapping(value = "confirm")
	public String confirm(String nickname, Model model) {
		Member member = ds.memberDetail(nickname);
		model.addAttribute("nickname", nickname);
		if(nickname !=null) {
			model.addAttribute("msg", "중복된 닉네임입니다");
			return "forward:/member/memberModifyForm";
		}else {
			model.addAttribute("msg", "사용 가능한 닉네임입니다");
			return "forward:/member/memberModifyForm";
		}
	}


	// Ajax  Sample1  
	//닉네임을 받아서 (member테이블에서)중복되었는지 확인한다
	@RequestMapping(value = "getNickName", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String getNickName(int deptno, Model model) {
		System.out.println("deptno->"+deptno);
		return ds.deptName(deptno);  // String --> 부서명 
	}
	*/

}
