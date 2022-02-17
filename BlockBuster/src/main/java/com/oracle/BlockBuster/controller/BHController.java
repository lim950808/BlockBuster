package com.oracle.BlockBuster.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.BlockBuster.model.BHDto;
import com.oracle.BlockBuster.service.BHService;

@Controller
public class BHController{
	
	@Autowired BHService bh;
	
	private static final Logger logger = LoggerFactory.getLogger(BHController.class);
	
//	@RequestMapping(value = "main", method = RequestMethod.GET)
//	public String home(Model model) {
//		System.out.println("main Start...");
//		return "main";
//	}
	
	@RequestMapping(value="/Admin/viewallMember", method = RequestMethod.GET)
	public String viewallMember(Model model) {
		BHDto bhdto = null;
		System.out.println("viewallMember Start");
		List<BHDto> listMem = bh.listMem(bhdto);
		model.addAttribute("listMem", listMem);
		return "/Admin/viewallMember";
		} 
	
	@ResponseBody
	@RequestMapping("/memberrowDelete")
	public String memberrowDelete(BHDto bhdto) { 
		System.out.println("@RestController memberrowDelete START");
		System.out.println("@RestController memberrowDelete bhdto.getId()->" + bhdto.getId());
		int delStatus = bh.delete(bhdto.getId());
		String delStatusStr = Integer.toString(delStatus);
		return delStatusStr;	
	}
		
	@RequestMapping("/chat")
	public ModelAndView chat(String id) {
		System.out.println("BHController Socket Start...");	
		// member의 nickName을 Get --> chatName
		String chatName = bh.chatName(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("chatNameNickname", chatName);
		mv.setViewName("chat");
		return mv;			
	}
//	@RequestMapping("/chat")
//	public ModelAndView chat(HttpSession session) {
//		System.out.println("BHController Socket Start...");	
//		// member의 nickName을 Get --> chatName
//		String id = (String)session.getAttribute("sessionId");
//		String chatName = bh.chatName(id);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("chatNameNickname", chatName);
//		mv.setViewName("chat");
//		return mv;			
//	}
	
//	@RequestMapping("/Chat/chat")
//	public ModelAndView chat(HttpSession session) {
//		System.out.println("BHController Socket Start...");	
//		String id = (String)session.getAttribute("sessionId");
//		// member의 nickName을 Get --> chatName
//		String chatName = bh.chatName(id);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("chatNameNickname", chatName);
//		mv.setViewName("chat");
//		return mv;			
//	}
		
}