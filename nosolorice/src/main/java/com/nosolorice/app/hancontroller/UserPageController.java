package com.nosolorice.app.hancontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
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
	public String userReportList(HttpSession session,Model model,@RequestParam(value="pageNum",required=false, defaultValue="1")int pageNum) {
		
		
		NormalUser normal = (NormalUser) session.getAttribute("NormalUser");
		
		String reporter = normal.getNormalId();
		
		Map<String, Object> userReportList = userPageService.userReportList(reporter,pageNum);
		
		model.addAllAttributes(userReportList);
		
		return "userReportList";
	}
	//차단 목록 리스트
	@RequestMapping("/blockList")
	public String blockList(HttpSession session,Model model,@RequestParam(value="pageNum",required=false, defaultValue="1")int pageNum) {
		
		
		NormalUser normal = (NormalUser) session.getAttribute("NormalUser");
		
		String blocker = normal.getNormalId();
		
		System.out.println(blocker + "컨트롤러 유저");
		
		Map<String, Object> map = userPageService.blockList(blocker,pageNum);
				
		model.addAllAttributes(map);
		
		return "blockList";
	}
	
	@RequestMapping("/blockUnlockProcess")
	@ResponseBody
	public Map<String,Object> blockUnlockProcess(int blockHistoryNo){
		
		System.out.println("컨트롤러에서의 블록번호----- : ");
		
		Map<String,Object> unlock = new HashMap<>();
		
		userPageService.blockUnlock(blockHistoryNo);
		
		unlock.put("unlock",true);
		
		return unlock;
		
		
	}
	
	
	
	

}
