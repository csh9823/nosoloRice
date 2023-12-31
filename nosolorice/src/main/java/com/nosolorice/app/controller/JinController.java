package com.nosolorice.app.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.businessUser.MenuCategory;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.rootUser.RootUser;
import com.nosolorice.app.jinservice.JinFindService;
import com.nosolorice.app.jinservice.JinMenuCateService;
import com.nosolorice.app.jinservice.JinMenuService;
import com.nosolorice.app.jinservice.JinbookService;
import com.nosolorice.app.jinservice.JinloginService;

@Controller
public class JinController {
	
	private static final String DEFAULT_PATH = "resources/upload";
	
	// 찾기 서비스
	@Autowired
	private JinFindService jinFindService; 
	
	
	
	// 로그인 서비스
	@Autowired
	private JinloginService jinloginService;
	
	
	
	// 메뉴 카테고리 관련 서비스
	@Autowired
	private JinMenuCateService jinMenuCateService;
	
	// 메뉴 관련 서비스
	@Autowired
	private JinMenuService jinMenuService;
	

	@Autowired
	private JinbookService jinbookService;

	
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

	
	//로그인 하기
	@RequestMapping("loginservice")
	public String login(@RequestParam(name="idsave", defaultValue = "0") Integer idsave,String id, String pass,
			HttpServletResponse response,HttpSession session ,PrintWriter out) {
		
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
		
		BusinessUser buser = jinloginService.loginBusinessUser(id, pass);
		
		NormalUser nuser = jinloginService.loginNormalUser(id, pass);
		
		RootUser ruser = jinloginService.loginRootUser(id, pass);
		
		if(buser != null) {
			
			System.out.println(buser.getBusinessId());
			
			session.setAttribute("BusinessUser", buser);
			return "redirect:businessUserStoreInfo?id="+buser.getBusinessId();
		}else if(nuser != null) {
			System.out.println(nuser.getNormalId());
			session.setAttribute("NormalUser", nuser);
			return "redirect:mainPage";
		}else if(ruser != null) {
			System.out.println(id);
			System.out.println(ruser.getRootId());
			session.setAttribute("RootUser", ruser);
			return "redirect:adminPage?RootId="+ruser.getRootId();
		}
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println("	alert('회원 정보가 일치하지 않습니다.');");
		out.println("	history.back();");
		out.println("</script>");
    	return null;

	}
	
	@RequestMapping("BusinessMenu")
	public String BusinessMenu(String businessId,Model model, @RequestParam(name="menuCategoryNo",required = false) String menuCategoryNo) {
		
		System.out.println(menuCategoryNo);
		
		if(menuCategoryNo == null) {
			List<MenuCategory> menuCategory = jinMenuCateService.MenuCateList(businessId);
			List<Map<String, Object>> map = jinMenuCateService.AllMenuList(businessId);
			model.addAttribute("menuCategory", menuCategory);
			model.addAttribute("map", map);
		}else{
			List<MenuCategory> menuCategory = jinMenuCateService.MenuCateList(businessId);
			List<Map<String, Object>> mapNoMenuList = jinMenuCateService.NoMenuList(menuCategoryNo);
			int intValue = Integer.parseInt(menuCategoryNo);
			String menucatename = jinMenuCateService.MenuCateName(intValue);
			model.addAttribute("menuCategory", menuCategory);
			model.addAttribute("mapNoMenuList", mapNoMenuList);
			model.addAttribute("menuCategoryNo",menuCategoryNo);
			model.addAttribute("menucatename",menucatename);
		}
		
		return "BusinessMenu/businessMenus";
	}
	
	// 카테고리 추가
	@RequestMapping("BusinessMenuCateadd")
	public String BusinessMenuCateadd(String businessId,String menuCateName) {
		
		jinMenuCateService.MenuCateadd(businessId,menuCateName);
		
		return "redirect:BusinessMenu?businessId="+businessId;
	}
	
	// 카테고리 삭제
	@RequestMapping("MenuCateDelete")
	public String MenuCateDelete(String businessId,int menuCategoryNo ,PrintWriter out,
			HttpServletResponse response) {
		try {
	        System.out.println("Delete Controller" + businessId + " : " + menuCategoryNo);

	        // Assuming MenuCateDelete method throws an exception in case of an error
	        jinMenuCateService.MenuCateDelete(businessId, menuCategoryNo);

	        return "redirect:BusinessMenu?businessId=" + businessId;
	    } catch (Exception e) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("	alert('카테고리 내의 메뉴를 먼저 삭제 해주세요');");
			out.println("	history.back();");
			out.println("</script>");
	    	return null;
	    }
	}
	
	// 파일이 있을때 메뉴 등록하기
	@RequestMapping("MenuAdd")
	public String MenuAdd(HttpServletRequest request,Menu menu ,@RequestParam(value="menuimg") MultipartFile multipartFile) 
			throws IOException {
		// 세션 값 저장하기
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		
		if(! multipartFile.isEmpty()) {
			// 파일이 들어갈 위치
			String realPath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			File file = new File(realPath,saveName);
			multipartFile.transferTo(file);
			menu.setMenuPicture(DEFAULT_PATH+"/"+saveName);
		}
		jinMenuService.MenuAdd(menu);
		return "redirect:BusinessMenu?businessId="+buser.getBusinessId()+"&"+"menuCategoryNo="+menu.getMenuCategoryNo();
	}
	
	
	// 파일이 없을때 메뉴 등록하기
	@RequestMapping("Nofilemenuadd")
	public String Nofilemenuadd(Menu menu,HttpServletRequest request) {
		
		// 세견 값 가져오기
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		jinMenuService.Nofilemenuadd(menu);
		
		return "redirect:BusinessMenu?businessId="+buser.getBusinessId()+"&"+"menuCategoryNo="+menu.getMenuCategoryNo();
	}
	
	//  예약 리스트 페이지
	@RequestMapping("yesnoList")
	public String yesnoList(String businessId , Model model) {
		
		// 부킹 no가 있는지 먼저 체크
		List<Booking> booking = jinbookService.BookingList(businessId);
		
		model.addAttribute("booking",booking);
		
		return "BusinessMenu/yesnoList";
	}
	
	@RequestMapping("bookingStateOk")
	public String bookingState(String businessId,int bookingNo ,String bookingState) {
		
		
		jinbookService.bookingState(businessId, bookingNo, bookingState);
		
		return "redirect:yesnoList?businessId="+businessId;
	}
	
	@RequestMapping("bookingStateDelete")
	public String bookingStateDelete(String businessId,int bookingNo) {
		
		jinbookService.bookinguserdelete(businessId, bookingNo);
		jinbookService.bookingStateDelete(businessId, bookingNo);
		return "redirect:yesnoList?businessId="+businessId;
	}
	
	@RequestMapping("Bookingok")
	public String Bookingok(BookingOk bookingOk,String bookingState) {
		jinbookService.bookingState(bookingOk.getBusinessId(), bookingOk.getBookingNo(), bookingState);
		jinbookService.bookingOkinsert(bookingOk);
		return "redirect:yesnoList?businessId="+bookingOk.getBusinessId();
	}
}
