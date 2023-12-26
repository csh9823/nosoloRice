package com.nosolorice.app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nosolorice.domain.businessUser.BusinessUser;
import com.nosolorice.service.BusinessUserService;

@Controller
@SessionAttributes("BusinessUser")
public class BusinessUserController {
	
	private BusinessUserService businessUserService;
	
	@Autowired
	public void setMemberService(BusinessUserService businessUserService) {
		this.businessUserService = businessUserService;
	}
	
	// 회원가입 완료 ===> 바로 회원가입이 아니라 대기처리를 해줘야함 수정필요
	@RequestMapping("/JoinResult")
	public String normalJoinResult(Model model, BusinessUser businessUser, String pass1) {
		businessUser.setPass(pass1);
		
		businessUserService.addBusinessUser(businessUser);
		
		return "redirect:loginForm";
	}
	
	// 중복체크
	@RequestMapping("/overlapNormalIdCheck")
	public String overlapNormalIdCheck(Model model, String businessId) {
		boolean overlap = businessUserService.overlapBusinessIdCheck(businessId);
		
		model.addAttribute("businessId", businessId);
		model.addAttribute("overlap", overlap);
		
		// 중복확인 체크 페이지로 이동시켜야하는데 안만듦...	
		return "forward:WEB-INF/views/";
	}
		

	
	
}
