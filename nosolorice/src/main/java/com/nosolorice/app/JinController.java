package com.nosolorice.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JinController {

	
	// 아이디 비밀번호 찾기 폼
	@RequestMapping("findForm")
	public String findForm() {
		
		return "login/findForm";
	}
	
	// 아이디 찾기 알려주기 폼
	@RequestMapping("FindidForm")
	public String FindidForm() {
		
		return "login/FindidForm";
	}
	
	// 비밀번호 변경
	@RequestMapping("Findpassword")
	public String Findpassword() {
		
		return "login/Findpassword";
	}
	
	// 아이디 찾기 인증번호 폼
	@RequestMapping("idFind")
	public String idFind() {
		
		return "login/idFind";
	}
	
	//회원가입폼
	@RequestMapping("joinForm")
	public String joinForm() {
		
		return "login/joinForm";
	}
	
	//로그인 폼
	@RequestMapping("login")
	public String login() {
		
		return "login/login";
	}
	
	// 비밀번호 찾기 인증폼
	@RequestMapping("newpassword")
	public String newpassword() {
		
		return "login/newpassword";
	}
}
