package com.nosolorice.app.hyuncontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component // loginCheckInterceptor
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response, Object arg2) 
					throws Exception {		
		// 로그인 체크
		if(request.getSession().getAttribute("NormalUser") != null) {
			response.sendRedirect("mainPage");
			return false;
		}
		if(request.getSession().getAttribute("BusinessUser") != null) {
			response.sendRedirect("businessUserStoreInfo");
			return false;
		}
		if(request.getSession().getAttribute("RootUser") != null) {
			response.sendRedirect("noticeList");
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
