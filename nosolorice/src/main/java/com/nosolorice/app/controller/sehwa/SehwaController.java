package com.nosolorice.app.controller.sehwa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SehwaController {
	
	@Autowired
	private SehwaService service;
	
	@RequestMapping(value= {"/businessUserInfoUpdate"}, method=RequestMethod.GET)
	public String businessUserInfoUpdate(Model model, String id) {
		model.addAttribute("user", service.getBusinessUserInfo(id));
		return "/sehwa/businessUserInfoUpdate";
	}
	

}
