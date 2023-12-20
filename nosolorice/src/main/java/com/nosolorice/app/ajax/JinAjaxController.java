package com.nosolorice.app.ajax;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nosolorice.app.jinservice.CertifiedPhoneNumberService;
import com.nosolorice.app.jinservice.JinFindService;

@Controller
public class JinAjaxController {
	
	@Autowired
	private CertifiedPhoneNumberService certifiedPhoneNumberService;
	
	// 찾기 서비스
	@Autowired
	private JinFindService jinFindService; 
	
	
	@RequestMapping("newpassword.ajax")
	@ResponseBody
	public HashMap<String, Object> sendSMS(String userPhoneNumber, String id) { 
		// 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		
		System.out.println(id);
		
		String businessid = jinFindService.IdFindbusiness(id);
		
		String normalid = jinFindService.IdFindnormal(id);
				
		System.out.println("에이작스 사업자 아이디 값 표시 : " + businessid);
		System.out.println("에이작스 사용자 아이디 값 표시 : " + normalid);
		
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
	
}
