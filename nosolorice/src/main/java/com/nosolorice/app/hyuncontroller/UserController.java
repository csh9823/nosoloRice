package com.nosolorice.app.hyuncontroller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.domain.normalUser.ChatHistory;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.UserInquiry;
import com.nosolorice.app.hyunservice.UserService;

@Controller
public class UserController {
	
	private UserService userService;
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	
	@RequestMapping("userInquiry")
	public String userInquiry(Model model) {
		return "userInquiry";
	}
	
	@RequestMapping("userInquiryList")
	public String userInquiryList(Model model, @RequestParam(required=false, defaultValue="1") int pageNum, HttpSession session) {
		
		/*
		 * BusinessUser bUser = (BusinessUser)session.getAttribute("businessUser");
		 * String businessId = bUser.getBusinessId();
		 */
		
		String normalId = "testNormalId";
		
		model.addAllAttributes(userService.getUserInquiryList(pageNum, normalId));
		
		return "userInquiryList";
	}
	
	@RequestMapping("writeUserInquiry")
	public String writeUserInquiry(Model model, UserInquiry userInquiry, 
			@RequestParam(value="file1", required=false)MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
		String defaultPath = "/resources/upload/";	
		
		if(!multipartFile.isEmpty()) {
			String filePath = 
					request.getServletContext().getRealPath(defaultPath);

			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);		

			multipartFile.transferTo(file);

			userInquiry.setInquiryPicture(saveName);
		}
		userService.writeUserInquiry(userInquiry);
		return "redirect:/userInquiryList";
	}
	
	@RequestMapping("matching")
	public String matching() {
		return "matching";
	}
	
	@RequestMapping("chating")
	public String chating() {
		return "chating";
	}
	
	@RequestMapping("matchingComplete")
	@ResponseBody
	public Map<String, Boolean> matchingComplete(@RequestBody Map<String, Object> requestMap, HttpSession session){
		
		NormalUser userInfo = (NormalUser)session.getAttribute("NormalUser");		
		requestMap.put("id", userInfo.getNormalId());
		userService.addChatRoom(requestMap);
		userService.addChatMember(requestMap);
		
		Map<String, Boolean> map = new HashMap<>();
		map.put("success", true);
		return map;
	}
	
	@RequestMapping("chatMemberCheck")
	@ResponseBody
	public Map<String, Object> chatMemberCheck(String id){
		return userService.chatMemberCheck(id);
	}
	
	@RequestMapping("addChatMessage")
	@ResponseBody
	public Map<String, Boolean> addChatMessage(ChatHistory chatHistory){
		userService.addChatMessage(chatHistory);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", true);
		return map;
	}
	
	@RequestMapping("chatImgUpload")
	@ResponseBody
	public Map<String, String> chatImgUpload(@RequestParam(value="image") MultipartFile mf, HttpServletRequest request) throws IllegalStateException, IOException{
		Map<String, String> map = new HashMap<>();
		
		if(! mf.isEmpty()) {
			String filePath = request.getServletContext().getRealPath("/resources/upload/");					
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + mf.getOriginalFilename();
			File file = new File(filePath, saveName);
			mf.transferTo(file);
			map.put("fileName", saveName);
		}
		
		return map;
	}
	
	@RequestMapping("isMatchingCheck")
	@ResponseBody
	public Map<String, Boolean> isMatchingCheck(String id){
		Map<String, Boolean> map = new HashMap<>();
		boolean result = userService.isMatchingCheck(id);
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping("getStoreListByMap")
	@ResponseBody
	public List<BusinessUser> getStoreListByMap(double lat, double lng){
		return userService.getStoreListByMap(lat, lng);
	}
	
	@RequestMapping("getStoreListByAddress")
	@ResponseBody
	public List<BusinessUser> getStoreListByAddress(String address){
		return userService.getStoreListByAddress(address);
	}
	
	@RequestMapping("getChatStoreReviewList")
	@ResponseBody
	public List<Review> getReviewList(String businessId){
		return userService.getReviewList(businessId);
	}
	
	@RequestMapping("getChatStoreMenuList")
	@ResponseBody
	public List<Menu> getMenuList(String businessId){
		System.out.println("컨트롤러에서 businessId : " + businessId);
		return userService.getMenuList(businessId);
	}
	
}
