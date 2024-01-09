package com.nosolorice.app.hancontroller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.UserInquiry;
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
	public Map <String,Object> searchId(String id) {
		
			Map<String, Object> map = new HashMap<>();
				
			NormalUser user  = adminPageService.searchId(id);
			
			if(user == null ) {
				
				map.put("result", false);
				return map;
			} 
				map.put("searchUserInfo", user);
				
				map.put("result", true);
				
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
	
	  //정지 유저
	  @RequestMapping("/deleteDeniedUser") 
	  public String deleteDeniedUser(@RequestParam("deniedUserNo")int deniedUserNo) {
		  
		  	adminPageService.unlockUser(deniedUserNo);
		  	
		  	return "redirect:/deniedList";
		  	
	  }
	  //업체 삭제 리스트
	  @RequestMapping("/businessDeleteList")
	  public String businessDeleteList(Model model,@RequestParam(value="pageNum", defaultValue="1")int pageNum) {
		  
		  Map<String,Object> bList =  adminPageService.businessDeleteList(pageNum);
		  
		  model.addAllAttributes(bList);
		  
		  return "/businessDeleteList";
	  }
	  //업체 삭제
	  @RequestMapping("/businessDelete")
	  @ResponseBody
	  public Map<String,Object> businessDelete(String businessId){
		  
		  
		  Map<String,Object> result = new HashMap<>();
		  
		  adminPageService.businessDelete(businessId);
		  
		  result.put("id",true);
		  
		  return result;

	  }
	  
	  @RequestMapping("/searchBusinessId")
	  @ResponseBody
	  public Map<String,Object> searchBusinessId(@RequestBody String id) throws IOException{
		  
		  System.out.println("컨트롤러에서 아이디 : " + id);
		  
		  ObjectMapper om = new ObjectMapper();	
		  
		  id = om.readTree(id).get("id").asText();
		 
		  Map<String,Object> map = new HashMap<>();
		  
		  BusinessUser  user = adminPageService.searchBusinessId(id);
	
		  
		  if(user == null) {
			  
			  map.put("result",false);
			  
			  return map;
		  }
		  
		  map.put("searchUserInfo",user);
		  map.put("result",true);
		  
		  	return map;
		  
	  }
	  
	  //리뷰 작성자 아이디 가져오기
	  @RequestMapping("/getReviewNormalUser")
	  @ResponseBody
	  public Map<String,Object> getReviewNormalUser(String id) {
		  
		  Map<String,Object> mapId = new HashMap<>();
		  
		  mapId.put("id",adminPageService.normalUser(id));

		  return mapId;
		  
	  }
	  
	  //리뷰 삭제 번호 가져오기
	  @RequestMapping("/reviewDeleteProcess")
	  @ResponseBody
	  public Map<String,Object>reviewDeleteProcess(int reviewNo,int pageNum){
		  
		  Map<String,Object> mapReview = new HashMap<>();
		  
		  adminPageService.reviewDelete(reviewNo);
		  
		  mapReview.put("result", true);

		  return mapReview;
	  }
	  
	  @RequestMapping("/adminNormalInquiryList")
	  public String adminNormalInquiryList(Model model,@RequestParam(value="pageNum", defaultValue="1")int pageNum){
		  
		  Map<String,Object> modelMap = adminPageService.adminNormalInquiryList(pageNum);
		  
		  model.addAllAttributes(modelMap);
	
		  return "/adminNormalInquiryList";
	  }
	  
	  @RequestMapping("/normalInquiryDetail")
	  public String normalInquiryDetail(Model model,int userInquiryNo,@RequestParam(value="pageNum", required=false, 
				defaultValue="1") int pageNum) {
		  
		  UserInquiry userInquiry = adminPageService.getInquiry(userInquiryNo);
		  
		  model.addAttribute("userInquiry",userInquiry);
		  model.addAttribute("pageNum",pageNum);
		  
		  return "/normalInquiryDetail";
	  }
	  
	  @RequestMapping("/answerInquiryWrite")
	  public String answerInquiryWrite() {
		  
		  return "/answerInquiryWrite";
	  }
	  
	  @RequestMapping("/answerInquiryProcess")
	  public String answerInquiry(String inquiryComment,Timestamp inquiryCommentRegDate) {
		 
		  UserInquiry userInquiry = new UserInquiry();
		  
		  userInquiry.setInquiryComment(inquiryComment);
		  userInquiry.setInquiryCommentRegDate(inquiryCommentRegDate);
		  
		  adminPageService.answerInquiry(userInquiry);
		  
		  return "redirect:/adminNormalInquiry";
		  
	  }
	  
	  
	  
	
	

	
	
	
	
}
