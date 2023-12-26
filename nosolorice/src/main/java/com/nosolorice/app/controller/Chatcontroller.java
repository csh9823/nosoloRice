package com.nosolorice.app.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nosolorice.app.domain.normalUser.NormalUser;

@Controller
public class Chatcontroller {

	@GetMapping("/chatting")
	public void chat(Model model) {
		
		NormalUser normaluser = (NormalUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("ChatController, Get Chat : " + normaluser.getNickName());
		
		model.addAttribute("normalId", normaluser.getNormalId());
	}
}
