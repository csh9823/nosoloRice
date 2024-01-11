package com.nosolorice.app.hyuncontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nosolorice.app.hyunservice.AdminService;

@Controller
public class AdminController {
	
	private AdminService adminService;
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
		
	@RequestMapping("joinApprove")
	public String joinApprove(Model model, @RequestParam(required=false, defaultValue="1") int pageNum) {	
		model.addAllAttributes(adminService.getJoinApproveList(pageNum));
		return "forward:/WEB-INF/views/joinApprove.jsp";
	}
	
	@RequestMapping("adminSales")
	public String adminSales(Model model, @RequestParam(required=false, defaultValue="1") int pageNum) {
		model.addAllAttributes(adminService.getDailySalesList(pageNum));
		return "forward:/WEB-INF/views/adminSales.jsp";
	}
	@RequestMapping("adminSalesMonth")
	public String adminSalesMonth(Model model, @RequestParam(required=false, defaultValue="1") int pageNum) {
		model.addAllAttributes(adminService.getMonthlySalesList(pageNum));
		return "forward:/WEB-INF/views/adminSalesMonth.jsp";
	}
	
	@RequestMapping("joinApproveProcess.ajax")
	@ResponseBody
	public Map<String, String> joinApproveProcess(int businessNumber, int no){	
		// 사업자 회원정보의 상태값 y로 바꾸기
		adminService.updateJoinApprove(businessNumber);
		adminService.deleteJoinApprove(no);
		Map<String, String> result = new HashMap<>();
		result.put("result", "ok");
		return result;
	};
	
	@RequestMapping("joinApproveDeleteProcess.ajax")
	@ResponseBody
	public Map<String, String> joinApproveDeleteProcess(int businessNumber, int no){	
		adminService.deleteJoinApprove(no);
		Map<String, String> result = new HashMap<>();
		result.put("result", "delete");
		return result;
	};
	

}
