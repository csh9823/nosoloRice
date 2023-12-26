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

import com.nosolorice.domain.normalUser.NormalUser;
import com.nosolorice.service.NormalUserService;

@Controller
@SessionAttributes("normalUser")
public class NormalUserController {
	
	private NormalUserService normalUserService;
	
	
	@Autowired
	public void setMemberService(NormalUserService normalUserService) {
		this.normalUserService = normalUserService;
	}
	
	// 회원가입 완료
	@RequestMapping("/normalJoinResult")
	public String normalJoinResult(Model model, NormalUser normalUser, String pass1) {
		normalUser.setPass(pass1);
		
		normalUserService.addNormalUser(normalUser);
		
		return "redirect:loginForm";
	}
	
	// 중복체크
	@RequestMapping("/overlapNormalIdCheck")
	public String overlapNormalIdCheck(Model model, String normalId) {
		boolean overlap = normalUserService.overlapNormalIdCheck(normalId);
		
		model.addAttribute("normalId", normalId);
		model.addAttribute("overlap", overlap);
		
		// 중복확인 체크 페이지로 이동시켜야하는데 안만듦...	
		return "forward:WEB-INF/views/";
	}
		

	
	
}
