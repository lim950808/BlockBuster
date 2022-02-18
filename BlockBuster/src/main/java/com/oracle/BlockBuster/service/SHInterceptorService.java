package com.oracle.BlockBuster.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;



public class SHInterceptorService implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(SHInterceptorService.class);

	
	public SHInterceptorService() {
		super();
	}
		
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("[INTERCEPTOR_전] preHandle 시작--------------------");
		
		logger.info("[INTERCEPTOR_전] sessionId 확인");
		
		HttpSession session  = request.getSession();
		
			if(session.getAttribute("sessionId")==null) {
				logger.info("[INTERCEPTOR_전] sessionId 확인 실패");
				
				if(request.getQueryString()!=null) {
				response.sendRedirect("/loginView?requestURL="+request.getRequestURL()+"?"+request.getQueryString());
				}else {
					response.sendRedirect("/loginView?requestURL="+request.getRequestURL());
				}
				return false;
				
			}
			
		logger.info("[INTERCEPTOR_전] sessionId 확인 성공");
		
	    return true; 
	}
}
