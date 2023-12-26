package com.nosolorice.app;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.jinservice.JinFindService;
import com.nosolorice.app.jinservice.JinloginService;

@Controller
public class JinController {
	
	// 찾기 서비스
	@Autowired
	private JinFindService jinFindService; 
	
	// 로그인 서비스
	@Autowired
	private JinloginService jinloginService;
	
	
	// 아이디 비밀번호 찾기 폼
	@RequestMapping("findForm")
	public String findForm() {
		
		return "login/findForm";
	}
	
	// 아이디 찾기 알려주기 폼
	@RequestMapping("FindidForm")
	public String FindidForm(String Findid,Model model) {
		
		model.addAttribute("Findid", Findid);
		
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
			return "redirect:login";
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
	
	// 비밀번호 찾기 인증폼
	@RequestMapping("newpassword")
	public String newpassword() {
		
		return "login/newpassword";
	}
	
	//회원가입폼
	@RequestMapping("joinForm")
	public String joinForm() {
		
		return "login/joinForm";
	}
	
	//로그인 폼
	@RequestMapping("login")
	public String login(@CookieValue(name= "saveId",required = false) String id,Model model) {
		
		// 쿠키 값 확인
		System.out.println(id);
		model.addAttribute("id",id);
		
		return "login/login";
	}

	@RequestMapping("loginservice")
	public String login(@RequestParam(name="idsave", defaultValue = "0") Integer idsave,String id, String pass,
			HttpServletResponse response,HttpSession session) {
		
		BusinessUser buser = jinloginService.loginBusinessUser(id, pass);
		
		NormalUser nuser = jinloginService.loginNormalUser(id, pass);
		
		if(buser != null) {
			System.out.println(buser.getBusinessId());
			session.setAttribute("BusinessUser", buser);
		}
		
		if(nuser != null) {
			System.out.println(nuser.getNormalId());
			session.setAttribute("NormalUser", nuser);
		}
		
		// 쿠키에 값 저장하기
		if(idsave != 0) {
			Cookie cookie = new Cookie("saveId" ,id);
			cookie.setMaxAge(60*60*24*30);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("saveId" ,id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		return "redirect:idFind";
	}

}
