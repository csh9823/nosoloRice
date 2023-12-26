package com.nosolorice.app.hyuncontroller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String businessInquiryList(Model model, @RequestParam(required=false, defaultValue="1") int pageNum, HttpSession session) {
		
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

}
