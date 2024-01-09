package com.nosolorice.app.hancontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String userReportList(Model model,@RequestParam(value="pageNum",required=false, defaultValue="1")int pageNum) {
		
		Map<String, Object> userReportList = userPageService.userReportList(pageNum);
		
		model.addAllAttributes(userReportList);
		
		return "userReportList";
	}
	//차단 목록 리스트
	@RequestMapping("/blockList")
	public String blockList(Model model,@RequestParam(value="pageNum",required=false, defaultValue="1")int pageNum,String blocker) {
		
		
		Map<String, Object> blockList = userPageService.blockList(pageNum);
		
		model.addAllAttributes(blockList);
		
		return "blockList";
	}
	

}
