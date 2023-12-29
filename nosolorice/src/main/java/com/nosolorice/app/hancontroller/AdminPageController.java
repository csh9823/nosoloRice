package com.nosolorice.app.hancontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.hanservice.AdminPageService;

@Controller
public class AdminPageController {
	
	private AdminPageService adminPageService;

	@Autowired
	public AdminPageController(AdminPageService adminPageService) {
		
		this.adminPageService = adminPageService;
	}
	
	//신고 리스트
	@RequestMapping("/adminReportList")
	public String reportList(Model model, @RequestParam(value="pageNum",required=false, defaultValue="1")int pageNum) {
		
		Map<String, Object> modelMap = adminPageService.reportList(pageNum);
		
		model.addAllAttributes(modelMap);
		
		return "/adminReportList";
	}
	
	//리뷰 리스트
	@RequestMapping("/adminReviewList")
	public String reviewList(Model model,@RequestParam(value="pageNum",required=false, defaultValue="1")int pageNum) {
		
		Map<String,Object> modelMap = adminPageService.reviewList(pageNum);
		
		model.addAllAttributes(modelMap);
		
		
		return "/adminReviewList";
	}
	
	//회원정지 리스트
	@RequestMapping("/deniedList")
	public String userBlockList(Model model,@RequestParam(value="pageNum",required=false, defaultValue="1")int pageNum) {
		
		
		Map<String,Object> modelMap = adminPageService.deniedList(pageNum);
		
		model.addAllAttributes(modelMap);
		
		return "/deniedList";
	}
	
	
	
	@RequestMapping("/searchId")
	@ResponseBody
	public Map <String,Boolean> searchId(String id) {
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		boolean result = adminPageService.searchId(id);
		
		map.put("result", result);
		
		
		return map;
		
	}
	
	@RequestMapping("/addDenied")
	@ResponseBody
	public Map <String,Object>  addDenied(String id,String reason,int day){
		
		adminPageService.addDenied(id, reason, day);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("deniedList", adminPageService.deniedList(1));

		return map;
		
	}
	
	
	  @RequestMapping("/deleteDeniedUser") 
	  public String deleteDeniedUser(@RequestParam("deniedUserNo")int deniedUserNo) {
		  
		  	adminPageService.unlockUser(deniedUserNo);
		  	
		  	return "redirect:/deniedList";
		  	
	  }
	  
	  @RequestMapping("/businessDeleteList")
	  public String businessDeleteList(Model model) {
		  
		  List<BusinessUser> bList =  adminPageService.businessDeleteList();
		  
		  model.addAttribute("bList",bList);
		  
		  return "/businessDeleteList";
	  }
	  
	
	

	
	
	
	
}
