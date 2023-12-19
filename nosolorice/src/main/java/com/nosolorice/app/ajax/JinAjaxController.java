package com.nosolorice.app.ajax;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nosolorice.app.jinservice.CertifiedPhoneNumberService;

@Controller
public class JinAjaxController {
	
	@Autowired
	private CertifiedPhoneNumberService certifiedPhoneNumberService;
	
	
	
	@RequestMapping("testphone.ajax")
	@ResponseBody
	public HashMap<String, Object> sendSMS(String userPhoneNumber) { 
		// 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		
		System.out.println(userPhoneNumber);
		
		Boolean isfalse = false;
		
		String number = Integer.toString(randomNumber);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("number", number);
		map.put("isfalse", isfalse);
		//certifiedPhoneNumberService.certifiedPhoneNumber(userPhoneNumber,number);
		
		return map;
	}
	
}
