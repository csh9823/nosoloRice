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

import com.nosolorice.app.domain.businessUser.BusinessInquiry;
import com.nosolorice.app.hyunservice.BusinessService;

@Controller
public class BusinessController {
	
	private BusinessService businessService;
	@Autowired
	public BusinessController(BusinessService businessService) {
		this.businessService = businessService;
	}
	

	@RequestMapping("businessInquiry")
	public String businessInquiry(Model model) {
		return "forward:/WEB-INF/views/businessInquiry.jsp";
	}
	
	@RequestMapping("writeBusinessInquiry")
	public String writeBusinessInquiry(Model model, BusinessInquiry businessInquiry, 
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

			businessInquiry.setBusinessPicture(saveName);
		}
		businessService.writeBusinessInquiry(businessInquiry);
		return "redirect:/WEB-INF/views/businessInquiryList.jsp";
	}
	
	@RequestMapping("businessInquiryList")
	public String businessInquiryList(Model model, @RequestParam(required=false, defaultValue="1") int pageNum, HttpSession session) {
		
		/*
		 * BusinessUser bUser = (BusinessUser)session.getAttribute("businessUser");
		 * String businessId = bUser.getBusinessId();
		 */
		
		String businessId = "testBusinessId";
		
		model.addAllAttributes(businessService.getBusinessInquiryList(pageNum, businessId));
		
		return "forward:/WEB-INF/views/businessInquiryList.jsp";
	}
	
	@RequestMapping("businessSales")
	public String businessSales(Model model,@RequestParam(required=false, defaultValue="1") int pageNum, HttpSession session) {
		/*
		 * BusinessUser bUser = (BusinessUser)session.getAttribute("businessUser");
		 * String businessId = bUser.getBusinessId();
		 */
		
		String businessId = "testBusinessId";
		
		model.addAllAttributes(businessService.getDailySalesList(pageNum, businessId));
		return "forward:/WEB-INF/views/businessSales.jsp";
	}
	
	@RequestMapping("businessSalesMonth")
	public String businessSalesMonth(Model model,@RequestParam(required=false, defaultValue="1") int pageNum, HttpSession session) {
		/*
		 * BusinessUser bUser = (BusinessUser)session.getAttribute("businessUser");
		 * String businessId = bUser.getBusinessId();
		 */
		
		String businessId = "testBusinessId";
		
		model.addAllAttributes(businessService.getMonthlySalesList(pageNum, businessId));
		return "forward:/WEB-INF/views/businessSalesMonth.jsp";
	}
	
}
