package com.nosolorice.app.ajax;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.jinservice.CertifiedPhoneNumberService;
import com.nosolorice.app.jinservice.JinFindService;
import com.nosolorice.app.jinservice.JinMenuCateService;
import com.nosolorice.app.jinservice.JinMenuService;

@Controller
public class JinAjaxController {
	
	@Autowired
	private CertifiedPhoneNumberService certifiedPhoneNumberService;
	
	// 메뉴 카테고리 관련 서비스
	@Autowired
	private JinMenuCateService jinMenuCateService;
	
	// 찾기 서비스
	@Autowired
	private JinFindService jinFindService; 
	
	// 메뉴 관련 서비스
	@Autowired
	private JinMenuService jinMenuService;
	
	@RequestMapping("newpassword.ajax")
	@ResponseBody
	public HashMap<String, Object> sendSMS(String userPhoneNumber, String id) { 
		// 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
				
		String businessid = jinFindService.IdFindbusiness(id,userPhoneNumber);
		
		String normalid = jinFindService.IdFindnormal(id,userPhoneNumber);
		
		String number = Integer.toString(randomNumber);
		
		if(businessid != null) {
			//certifiedPhoneNumberService.certifiedPhoneNumber(userPhoneNumber,number);
		}
		
		if(normalid != null) {
			//certifiedPhoneNumberService.certifiedPhoneNumber(userPhoneNumber,number);
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("number", number);
		map.put("businessid", businessid);
		map.put("normalid", normalid);

		
		return map;
	}

	@RequestMapping("Findid.ajax")
	@ResponseBody
	public HashMap<String, Object> Findid(String userPhoneNumber, String name) { 
		// 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
				
		String businessid = jinFindService.IdFindbusinessName(name,userPhoneNumber);
		
		String normalid = jinFindService.IdFindnormalName(name,userPhoneNumber);
		
		String number = Integer.toString(randomNumber);
		
		if(businessid != null) {
			//certifiedPhoneNumberService.certifiedPhoneNumber(userPhoneNumber,number);
		}
		
		if(normalid != null) {
			//certifiedPhoneNumberService.certifiedPhoneNumber(userPhoneNumber,number);
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("number", number);
		map.put("businessid", businessid);
		map.put("normalid", normalid);

		return map;
	}
	
	@RequestMapping("MenudleteForm.ajax")
	@ResponseBody
	public List<Map<String, Object>> MenudleteForm (@RequestParam(name="menuCategoryNo",required = false) String menuCategoryNo,HttpServletRequest request){
		BusinessUser buser = (BusinessUser) request.getSession().getAttribute("BusinessUser");
		System.out.println(menuCategoryNo);
		
		
		if(menuCategoryNo.equals("undefined")) {
			System.out.println(buser.getBusinessId());
			List<Map<String, Object>> map = jinMenuCateService.AllMenuList(buser.getBusinessId());
			return map;
		}else{
			
			List<Map<String, Object>> map = jinMenuCateService.NoMenuList(menuCategoryNo);
			
			return map;
		}
	}
	
	@RequestMapping("Menudelete.ajax")
	@ResponseBody
	public void Menudelete (int menuNo,HttpServletRequest request){
		String getmenu = jinMenuService.getMenu(menuNo);
		if(getmenu != null) {
			String realPath = request.getServletContext().getRealPath(getmenu);
			File file = new File(realPath);
			file.delete();
		}
		jinMenuService.MenuDelete(menuNo);
	}

	@RequestMapping("getMenu.ajax")
	@ResponseBody
	public Menu getMenu(int menuNo) {
		Menu menu = jinMenuService.getMenuajax(menuNo); 
		return menu;
	}
}
