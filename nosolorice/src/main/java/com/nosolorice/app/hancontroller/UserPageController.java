package com.nosolorice.app.hancontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
import com.nosolorice.app.hanservice.UserPageService;

@Controller
public class UserPageController {
	
	private UserPageService userPageService;

	@Autowired
	public UserPageController(UserPageService userPageService) {
		
		this.userPageService = userPageService;
	}
	
	//신고 목록 리스트
	@RequestMapping("/userReportList")
	public String deniedList(Model model) {
		
		List<ReportDetails> userReportList = userPageService.reportList();
		
		model.addAttribute("userReportList",userReportList);
		
		return "userReportList";
	}
	//차단 목록 리스트
	@RequestMapping("/blockList")
	public String blockList(Model model) {
		
		List<BlockHistory> blockList = userPageService.blockList();
		
		model.addAttribute("blockList",blockList);
		
		return "blockList";
	}
	
	

}
