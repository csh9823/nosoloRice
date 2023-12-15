package com.nosolorice.app.controller.sehwa;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.businessUser.BusinessUser;

@Controller
public class SehwaController {
	
	@Autowired
	private SehwaService service;
	
	@RequestMapping(value={"/businessUserInfoUpdate"}, method=RequestMethod.GET)
	public String businessUserInfoUpdate(Model model, String id) {
		model.addAttribute("user", service.getBusinessUserInfo(id));
		
		return "sehwa/businessUserInfoUpdate";
	}
	
	@RequestMapping(value={"/businessUserInfoUpdate"}, method=RequestMethod.POST)
	public String businessUserInfoUpdate(Model model, 
					@RequestParam(value="fileInput", required = false) MultipartFile multi,
					String businessId, String pass,
					String mobile1, String mobile2, String mobile3, String mail, String domain, 
					String name, String businessName, String bankName, int bankNumber,
					String phone1, String phone2, String phone3, int postNum, String address1, 
					@RequestParam(required = false, defaultValue = "") String address2) {
		
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email = mail + domain;
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		System.out.println("pass : " + pass);
		
		BusinessUser user = new BusinessUser();
		user.setBusinessId(businessId);
		user.setPass(pass);
		user.setMobile(mobile);
		user.setEmail(email);
		user.setName(name);
		user.setBusinessName(businessName);
		user.setBankName(bankName);
		user.setBankNumber(bankNumber);
		user.setPhone(phone);
		user.setPostNum(postNum);
		user.setAddress1(address1);
		user.setAddress2(address2);
		
		service.businessUserInfoUpdate(user);
		
		return "sehwa/businessUserInfoUpdate?id=" + businessId;
	}	

}
