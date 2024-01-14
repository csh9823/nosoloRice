package com.nosolorice.app.hyuncontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component // loginCheckInterceptor
public class RootLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response, Object arg2) 
					throws Exception {		
		// 로그인 체크
		if(request.getSession().getAttribute("RootUser") == null) {
			// 로그인 상태가 아니라면 - loginForm으로 이동시킴
			response.sendRedirect("login");
			return false;
		}
		
		return true;
	}	
	
	@Override
	public void postHandle(
			HttpServletRequest arg0, HttpServletResponse arg1, 
			Object arg2, ModelAndView arg3)
					throws Exception {		
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest arg0, HttpServletResponse arg1, 
			Object arg2, Exception arg3)
					throws Exception {
	}
}
