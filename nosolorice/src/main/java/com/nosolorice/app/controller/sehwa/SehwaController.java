package com.nosolorice.app.controller.sehwa;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

@Controller
public class SehwaController {
	
	@Autowired
	private SehwaService service;
	
	private static final String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping(value={"/", "/businessUserInfoUpdate"}, method=RequestMethod.GET)
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
	
	@RequestMapping(value={"/businessUserStoreInfo"}, method=RequestMethod.GET)
	public String businessUserStoreInfo(Model model) {
		String id = "testBusinessId";
		model.addAttribute("user", service.getBusinessUserInfo(id));
		// 업종 셀렉트

		return "sehwa/businessUserStoreInfo";
	}
	
	@RequestMapping(value= {"/storeDepositUpdate.ajax"}, method=RequestMethod.POST)
	@ResponseBody
	public int storeDepositUpdate(String id, int deposit) {
		service.storeDepositUpdate(id, deposit);
		return deposit;
	}

	@RequestMapping(value= {"/storeTimeUpdate.ajax"}, method=RequestMethod.POST)
	@ResponseBody
	public void storeTimeUpdate(String id, String openTime, String closeTime,
											String dayOff, String breakTime) {
		service.storeTimeUpdate(id, openTime, closeTime, dayOff, breakTime);
	}
	
	@RequestMapping(value= {"/storeIntroductionUpdate.ajax"}, method = RequestMethod.POST)
	@ResponseBody
	public void storeIntroductionUpdate(String id, String introduction) {
		service.storeIntroductionUpdate(id, introduction);
	};

	@RequestMapping(value= {"/storeSectorUpdateBtn.ajax"}, method= RequestMethod.POST)
	@ResponseBody
	public void storeSectorUpdateBtn(String id, String sectors) {
		
	}
	
	@RequestMapping(value= {"/noramlUserBookingList"}, method=RequestMethod.GET)
	public String noramlUserBookingList(Model model) {
		String id = "testNormalId";
		// 현재 예약내역
		model.addAllAttributes(service.getCurrentBooking(id));
		// 지난 예약내역
		model.addAllAttributes(service.getPastBooking(id));
		return "sehwa/noramlUserBookingList";
	}
	
	@RequestMapping(value= {"/insertReview"}, method=RequestMethod.POST)
	public String insertReview(String reviewNormalUser, String reviewBusinessUser, int reviewBookingNo,
							int starPoint, String reviewContent, 
							@RequestParam(value="reviewFileInput", required = false) MultipartFile multi,
							HttpServletRequest request) throws IOException {
		Review review = new Review();
		review.setNormalId(reviewNormalUser);
		review.setBusinessId(reviewBusinessUser);
		review.setBookingOkNo(reviewBookingNo);
		review.setReviewScore(starPoint);
		review.setReviewContent(reviewContent);

		if(multi != null) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multi.getOriginalFilename();
			File file = new File(filePath, saveName);
			multi.transferTo(file);
			review.setReviewPicture(saveName);
		}

		service.insertReview(review);
		
		return "redirect:/noramlUserBookingList";
	}
	
	@RequestMapping(value= {"/insertReport.ajax"}, method=RequestMethod.POST)
	@ResponseBody
	public void insertReport(String reporter, String attacker, String reportContent,
							@RequestParam(value="reportFileInput", required = false) MultipartFile multi,
							HttpServletRequest request) throws IOException {
		String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString() + "_" + multi.getOriginalFilename();
		File file = new File(filePath, saveName);
		multi.transferTo(file);
		
		ReportDetails report = new ReportDetails();
		report.setReportReporter(reporter);
		report.setReportAttacker(attacker);
		report.setReportContent(reportContent);
		report.setReportPicture(saveName);
		
		service.insertReport(report);
	}
	
	@RequestMapping(value= {"/insertBlock.ajax"}, method=RequestMethod.POST)
	@ResponseBody
	public void insertBlock(String blocker, String attacker) {
		service.insertBlock(blocker, attacker);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
