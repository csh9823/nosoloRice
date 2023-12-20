package com.nosolorice.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nosolorice.app.jinservice.JinFindService;

@Controller
public class JinController {
	
	// 찾기 서비스
	@Autowired
	private JinFindService jinFindService; 
	
	
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
	
	// 비밀번호 변경폼
	@RequestMapping("Findpassword")
	public String Findpassword(String id, int normalORbusiness, Model model) {

		model.addAttribute("id", id);
		model.addAttribute("normalORbusiness", normalORbusiness);
		
		return "login/Findpassword";
	}
	
	// 비밀번호 변경하기
	@RequestMapping("newpass")
	public String newpass(String id, int normalORbusiness,String pass) {
		
		System.out.println(id);
		System.out.println(normalORbusiness);
		
		if(normalORbusiness == 0) {
			jinFindService.newpassbusiness(id, pass);
			return "redirect:login/login";
		}else {
			jinFindService.newpassnormal(id, pass);
			return "redirect:login";
		}
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
