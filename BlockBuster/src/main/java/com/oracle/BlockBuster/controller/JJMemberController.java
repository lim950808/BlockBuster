package com.oracle.BlockBuster.controller;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.BlockBuster.model.JJMember;
import com.oracle.BlockBuster.service.JJMemberService;
import com.oracle.BlockBuster.service.MainService;
import com.oracle.BlockBuster.service.loginCheck;

@Controller
public class JJMemberController {
	
private static final Logger logger = LoggerFactory.getLogger(JJMemberController.class);
	
	@Autowired
	private JJMemberService ms;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private loginCheck loginCheck;
	
	@Autowired
	public MainService mainService;
	
	@GetMapping(value = "/")
	public String welcome() {
		logger.info("welcome 시작");
		return "welcome";
	}
	
	
	//로그인 시작
	@GetMapping(value="loginView")
	public String loginView() {
		logger.info("loginView시작....");
		return "member/login";
	}
	
	//로그인 수행
	@GetMapping(value="login")
	public String login(JJMember member, String requestURL, HttpServletRequest request) {
		logger.info("login 시작");
		HttpSession session = request.getSession();
		session.setAttribute("sessionId", member.getId());
		
		String name = mainService.nameGet(loginCheck.checkSessionId(request));
		session.setAttribute("Nickname", name);
		
		String requestURLrst = requestURL==null || requestURL.equals("") ? "/main" : requestURL;
		
		return	"redirect:"+requestURLrst;
		//return "redirect:/loginView";
	}
	
//	@GetMapping(value="login")
//	public String login(JJMember member, HttpServletRequest request) {
//		String requestURL = null;
//		logger.info("login 시작");
//		HttpSession session = request.getSession();
//		session.setAttribute("sessionId", member.getId());
//		
//		requestURL = requestURL==null || requestURL.equals("") ? "/main" : requestURL;
//		
//		return	"redirect:"+requestURL;
//		//return "redirect:/loginView";
//	}
	
	@RequestMapping("idpwCheck")
	@ResponseBody
	public String idpwCheck(JJMember member, Model model) {
		logger.info("idpwCheck 시작");
		String result = ms.idpwCheck(member);
		System.out.println("idpwCheck의 result => "+result);
		return result;
	} //login 끝
	
	
	//회원가입 시작
	@GetMapping("registrationView")
	public String registrationView() {
		logger.info("registrationView 시작...");
		return "member/registration";
	}
	
	 @RequestMapping("registration.do")
		public String registration(JJMember member, Model model)  {
			logger.info("registration 시작...");
			//이메일 아이디를 일단 받아서 있는지 db에서 조회하고 있으면 임시 메일 발송할수 있게 / 없으면 없는 이메일로 안내처리
			System.out.println("MemberController의 registration 시작...");
			String tomail = member.getEmail(); // 받는사람 (비밀번호 찾기 form에서 받아서 parameter로 받은걸 변수 처리)
			System.out.println(tomail);
			String setFrom = member.getEmail();  // 비밀번호 찾기에 활용하려면(admnin메일 주소 하나 만들어서 여기서 발송처리)
			String title = "회원가입 인증 이메일 입니다.";//타이틀

			try{
				//Mine전자우편 Internet 표준 format(Mine = 전자 우편을 위한 인터넷 표준 프로토콜)
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true,  "UTF-8");
				messageHelper.setFrom(setFrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				String code = (int) (Math.random()*999999)+1+"";
				messageHelper.setText("이메일 인증번호 = "+code); //메일내용
				System.out.println("이메일 인증번호 = "+code);
				//DataSource dataSource = new FileDataSource("c:\\logs\\kht0306.jpg"); //첨부문서 같이 보내기
				//messageHelper.addAttachment(MimeUtility.encodeText("airport.png","UTF-8","B"),dataSource); 
				//addAttachment(첨부파일 보내는 메서드) encodeText=보내는 실제사진의 파일명 리네임
				mailSender.send(message);
				model.addAttribute("mailSendResult",1);// 정상전달	
				model.addAttribute("code",code);
				System.out.println("보낸 코드 값 code => "+code);
			}catch(Exception e) {
				System.out.println("MemberController의 registration의 오류 => "+e.getMessage());
				model.addAttribute("mailSendResult",2);// 전달 실패
			}
			model.addAttribute("member",member);
			return "member/emailCheck";
		}
	 
	 
	 @RequestMapping(value="regSubmit.do")
	 public String regSubmit(Model model, JJMember member, HttpServletRequest request) {
		 logger.info("regSubmit시작....");
		 request.setAttribute("id", member);
		 request.setAttribute("password", member);
		 request.setAttribute("nickname", member);
		 request.setAttribute("email", member);
		 ms.regSubmit(member);
		 return "member/regSuccess";
	 }
	 
	
	@RequestMapping(value="/idCheck.do")
	@ResponseBody
	public String idCheck(JJMember member, HttpServletRequest request) {
		logger.info("idCheck 시작...");
		String result= ms.idCheck(member);
		return result;
	}
	
	
	 @RequestMapping(value="/nicknameCheck.do")
	 @ResponseBody public String nicknameCheck(JJMember member, HttpServletRequest request ) {
	 logger.info("nicknameCheck시작..."); 
	 String result = ms.nicknameCheck(member);
	 return result; 
	 }
	 	
	//회원가입 끝
	
	 @GetMapping("findPwView.do")
	 	public String findPwView() {
		logger.info("findPwView 시작...");
		return "member/findPw";
	 }
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutMainGet(HttpServletRequest request) throws Exception{
		logger.info("logOut 시작");
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "forward:/";
		
	}
}
