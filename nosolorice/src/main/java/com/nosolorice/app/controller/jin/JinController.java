package com.nosolorice.app.controller.jin;

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

import com.nosolorice.app.controller.jin.SessionConfig;
import com.nosolorice.app.domain.booking.Booking;
import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingUserList;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.businessUser.MenuCategory;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.rootUser.RootUser;
import com.nosolorice.app.jinservice.JinFindService;
import com.nosolorice.app.jinservice.JinMenuCateService;
import com.nosolorice.app.jinservice.JinMenuService;
import com.nosolorice.app.jinservice.JinReviewService;
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

	// 예약 관련 서비스

	@Autowired
	private JinbookService jinbookService;

	
	// 리뷰 관련 서비스
	@Autowired
	private JinReviewService jinReviewService; 
	// 아이디 비밀번호 찾기 폼
	@RequestMapping("findForm")
	public String findForm() {
		
		return "forward:/WEB-INF/views/login/findForm.jsp";
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
		
		return "forward:/WEB-INF/views/login/idFind.jsp";
	}
	
	// 비밀번호 찾기 인증폼
	@RequestMapping("newpassword")
	public String newpassword() {
		
		return "forward:/WEB-INF/views/login/newpassword.jsp";
	}
	
	//회원가입폼
	@RequestMapping("joinForm")
	public String joinForm() {
		
		return "forward:/WEB-INF/views/login/joinForm.jsp";
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:login";
	}
	
	//로그인 폼
	@RequestMapping("login")
	public String login(@CookieValue(name= "saveId",required = false) String id,Model model) {
		
		// 쿠키 값 확인
		System.out.println(id);
		model.addAttribute("id",id);
		
		return "forward:/WEB-INF/views/login/login.jsp";
	}

	//로그인 하기
	@RequestMapping("loginservice")
	public String login(@RequestParam(name="idsave", defaultValue = "0") Integer idsave,String id, String pass,
			HttpServletResponse response,HttpSession session ,PrintWriter out,HttpServletRequest request) {
		
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
		String stop = jinloginService.deniedUser(id);
		
		if(buser != null) {
			System.out.println(buser.getBusinessId());
			session.setAttribute("BusinessUser", buser);
			return "redirect:businessUserStoreInfo?Id="+buser.getBusinessId();
		}
		
		if(nuser != null) {
			
			if(stop != null) {
				response.setContentType("text/html; charset=utf-8");
				out.println("<script>");
				out.println("	alert('정지된 회원 입니다.');");
				out.println("	history.back();");
				out.println("</script>");
				return null;
			}else {
				 // 중복 로그인 여부 확인
			    String duplicateSessionId = SessionConfig.getSessionidCheck("NormalUser", nuser.getNormalId());
			    System.out.println("중복로직"+duplicateSessionId);
			    if (!duplicateSessionId.isEmpty()) {
			            response.setContentType("text/html; charset=utf-8");
			            out.println("<script>");
			            out.println("    alert('이미 로그인 중인 회원입니다. 로그인 중인 아이디를 로그아웃 시킵니다.');");
			            out.println("    history.back();");
			            out.println("</script>");
			            return null;
			    }
			    // 세션 속성 설정 및 메인 페이지로 리다이렉트
			    session = request.getSession();
			    session.setAttribute("NormalUser", nuser);
			    return "redirect:mainPage";
			}
		}
		
		if(ruser != null) {
			session.setAttribute("RootUser", ruser);
			return "redirect:noticeList";
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
		
		return "forward:/WEB-INF/views/BusinessMenu/businessMenus.jsp";
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
			menu.setMenuPicture(saveName);
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
		return "forward:/WEB-INF/views/BusinessMenu/yesnoList.jsp";
	}
	
	
	// 예약 수락
	@RequestMapping("bookingStateOk")
	public String bookingState(BookingOk bookingOk,String bookingState,String businessId) {

		System.out.println(bookingOk.toString());
		System.out.println(bookingState + businessId);
		jinbookService.bookingState(bookingOk.getBusinessId(), bookingOk.getBookingNo(), bookingState);
		// 부킹  ok 승인
		jinbookService.bookingOkinsert(bookingOk);
		return "redirect:yesnoList?businessId="+businessId;
	}
	
	//예약거절
	@RequestMapping("bookingStateDelete")
	public String bookingStateDelete(String businessId,int bookingNo) {
		
		// 반복이 완료 되면 부킹 유저 리스트 삭제 해줌
		jinbookService.bookinguserdelete(businessId, bookingNo);
		
		jinbookService.bookingStateDelete(businessId, bookingNo);
		return "redirect:yesnoList?businessId="+businessId;
	}
	
	// 방문 완료
	@RequestMapping("Bookingok")
	public String Bookingok(BookingOk bookingOk) {
		// 부킹 ok no 가져오기
		int bookingOkno = jinbookService.getbookingOknumber(bookingOk.getBookingNo());
		System.out.println("부킹ok의 no값"+bookingOkno);
		// 방문완료로 처리해주는거
		jinbookService.bookingState(bookingOk.getBusinessId(), bookingOk.getBookingNo(), bookingOk.getBookingOkState());		
		// 부킹된 유저 리스트 가져오기의 아이디 가져오기
		List<BookingUserList> bookuser =  jinbookService.bookingUserList(bookingOk.getBusinessId(), bookingOk.getBookingNo());
		// 부킹 유저 리스트의 아이디를 가져와서 각 아이디 별로 반복문으로 인설트 해줌
		for (BookingUserList bookingUser : bookuser) {
			jinbookService.visitantuseradd(bookingUser.getNormalId(),bookingOk.getBusinessId(),bookingOkno);
			// 아이디 가져오는거 까지 확인 완료
			System.out.println(bookingUser.getNormalId());
		}
		// 반복이 완료 되면 부킹 유저 리스트 삭제 해줌
		jinbookService.bookinguserdelete(bookingOk.getBusinessId(), bookingOk.getBookingNo());
		return "redirect:yesnoList?businessId="+bookingOk.getBusinessId();
	}

	// 파일이 있을때 메뉴 업데이트 하기
	@RequestMapping("menuUpdate")
	public String menuUpdate(HttpServletRequest request,Menu menu ,@RequestParam(value="menuimgupdate") MultipartFile multipartFile, String menuInfoupdate) 
			throws IOException {
		
		// 세션 값 가져오기
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		menu.setMenuInfo(menuInfoupdate);
		

		if(! multipartFile.isEmpty()) {
			// 파일이 들어갈 위치
			String realPath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			File file = new File(realPath,saveName);
			multipartFile.transferTo(file);
			menu.setMenuPicture(saveName);
			
			// 기존 파일 삭제하기
			String getmenu = jinMenuService.getMenu(menu.getMenuNo());
			if(getmenu != null) {
				String real = request.getServletContext().getRealPath(getmenu);
				File file2 = new File(real);
				file2.delete();
			}
		}
		
		jinMenuService.MenuUpdate(menu);
		return "redirect:BusinessMenu?businessId="+buser.getBusinessId()+"&"+"menuCategoryNo="+menu.getMenuCategoryNo();
	}
	
	// 파일이 없을때 메뉴 업데이트 하기
	@RequestMapping("NofilemenuUpdate")
	public String Nofilemenuupdate(Menu menu,HttpServletRequest request,String menuInfoupdate) {
		System.out.println("노파일 업데이트 옴");
		menu.setMenuInfo(menuInfoupdate);
		
		System.out.println("노파일 업데이트"+menu.getMenuPicture());
		
		// 세견 값 가져오기
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		jinMenuService.MenuUpdate(menu);
		return "redirect:BusinessMenu?businessId="+buser.getBusinessId()+"&"+"menuCategoryNo="+menu.getMenuCategoryNo();
	}
	
	//리뷰 페이지 Businessriview.jsp
	@RequestMapping("Businessriview")
	public String Businessriview(String businessId,Model model) {
		String count = jinReviewService.getreviewcoung(businessId);
		List<Map<String,Object>> map = jinReviewService.ReviewList(businessId);
		model.addAttribute("review",map);
		model.addAttribute("reviewCount", count);
		return "forward:/WEB-INF/views/review/Businessriview.jsp";
	}
	
	// 리뷰 블라인드 처리
	@RequestMapping("Businessriviewblind")
	public void Businessriviewblind(int revireNo,HttpServletRequest request,PrintWriter out,
			HttpServletResponse response) {
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		jinReviewService.Businessriviewblind(revireNo);
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println("	alert('블라인드 처리가 완료 되었습니다.');");
		out.println(" window.location.href = 'Businessriview?businessId="+buser.getBusinessId() + "';");
		out.println("</script>");
	}
	
	// 리뷰 삭제 요청
	@RequestMapping("Businessriviewdelete")
	public void Businessriviewdelete(int revireNo,HttpServletRequest request,PrintWriter out,
			HttpServletResponse response) {
		jinReviewService.Businessriviewdelete(revireNo);
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println("	alert('삭제 요청이 완료 되었습니다.');");
		out.println(" window.location.href = 'Businessriview?businessId="+buser.getBusinessId() + "';");
		out.println("</script>");
	}
	
	//답글 달기
	@RequestMapping("Businessreviewadd")
	public void Businessreviewadd (int reviewNo, String normalId, String businessId,String businessComment,HttpServletRequest request,PrintWriter out,
			HttpServletResponse response) {
		
		jinReviewService.Businessreviewadd(reviewNo, normalId, businessId, businessComment);
		
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println(" alert('답글 등록이 완료되었습니다.');");
		out.println(" window.location.href = 'Businessriview?businessId="+businessId + "';");
		out.println("</script>");
	}
	
	// 답글 수정
	@RequestMapping("OwnerCommentupdate")
	public void OwnerCommentupdate (String businessComment2, int reviewNo,HttpServletRequest request,HttpServletResponse response,PrintWriter out) {
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		
		jinReviewService.OwnerCommentupdate(businessComment2, reviewNo);
		
		response.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println("	alert('답글 수정이 완료 되었습니다.');");
		out.println(" window.location.href = 'Businessriview?businessId="+buser.getBusinessId() + "';");
		out.println("</script>");
	}
	
	//답글 삭제
	@RequestMapping("OwnerCommentdelete")
	public void OwnerCommentdelete(int reviewNo,HttpServletRequest request,HttpServletResponse response,PrintWriter out) {
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		jinReviewService.OwnerCommentdelete(reviewNo);
		response.setContentType("text/html; charset=utf-8");
		
		out.println("<script>");
		out.println("	alert('답글 삭제가 완료 되었습니다.');");
		out.println(" window.location.href = 'Businessriview?businessId="+buser.getBusinessId() + "';");
		out.println("</script>");
	}
}
