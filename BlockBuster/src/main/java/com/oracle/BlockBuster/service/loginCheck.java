package com.oracle.BlockBuster.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.BlockBuster.dao.JJMemberDao;
import com.oracle.BlockBuster.model.JJMember;


@Service
public class loginCheck {
	private static final Logger logger = LoggerFactory.getLogger(loginCheck.class);
	
	
	//DB와 검증하도록 바꿔야 함
	public boolean loginCheck(String id, String password) {
		logger.info("[*-2] loginCheck, 최초 로그인 시 id/pw 검증");
		return "hwivelop".equals(id) && "1234".equals(password); //임시 사용일 경우, 본인 아이디랑 비밀번호로 변경 하세요.
	}
	
	
	//세션에 저장된 Id값을 true, false로 반환
	public boolean checkSessionIdB(HttpServletRequest request) {
		logger.info("[*-2] loginCheck, sessionId boolean으로 반환");
		HttpSession session  = request.getSession();

		return session.getAttribute("sessionId")!=null;
	}
	
	
	//세션에 저장된 Id값을 String으로 반환
	public String checkSessionId(HttpServletRequest request) {
		logger.info("[*-2] loginCheck, sessionId String으로 반환");
	
		HttpSession session  = request.getSession();
		String sessionId = (String)session.getAttribute("sessionId");
		System.out.println("logincheck : "+sessionId);
		return sessionId;
	}
	
	
}
