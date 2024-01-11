package com.nosolorice.app.controller.sehwa;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessSectors;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;

import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Controller
public class SehwaController {
	
	@Autowired
	private SehwaService service;
	
	private static final String DEFAULT_PATH = "/resources/upload/";
	
	
	@RequestMapping(value="/checkBusinessPass.ajax", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkPass(String id, String inputPass, String type) {
		boolean isPass = false;
		String pass = "";
		if(type.equals("business")) {
			pass = service.getBusinessUserInfo(id).getPass();
		} else if(type.equals("normal")) {
			pass = service.getNormalUserInfo(id).getPass();
		}
		
		if (pass.equals(inputPass)) isPass = true;
		
		return isPass;
	}
	
	@RequestMapping(value="/checkBusinessMobile.ajax", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkMobile(String id, String inputMobile, String type) {
		boolean isMobile = false;
		String mobile = "";
		if(type.equals("business")) {
			mobile = service.getBusinessUserInfo(id).getMobile();
		} else if(type.equals("normal")) {
			mobile = service.getNormalUserInfo(id).getMobile();
		}
		
		if(mobile.equals(inputMobile)) isMobile = true;
		
		return isMobile;
	}
	
	@RequestMapping(value="/checkNormalNickName.ajax", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkNormalNickName(String nickName) {
		boolean result = service.checkNormalNickName(nickName);
		
		return result;
	}
	
	@RequestMapping(value={"/businessUserInfoUpdate"}, method=RequestMethod.GET)
	public String businessUserInfoUpdate(Model model, String id) {
		model.addAttribute("BusinessUser", service.getBusinessUserInfo(id));
		
		return "forward:/WEB-INF/views/sehwa/businessUserInfoUpdate.jsp";
	}
	
	@RequestMapping(value={"/businessUserInfoUpdate"}, method=RequestMethod.POST)
	public String businessUserInfoUpdate(Model model, 
					@RequestParam(value="fileInput", required = false) MultipartFile multi,
					String businessId, String oldPass, @RequestParam(required = false) String pass,
					String mobile1, String mobile2, String mobile3, String mail, String domain, 
					String name, String businessName, String bankName, int bankNumber,
					String phone1, String phone2, String phone3, int postNum, String address1, 
					@RequestParam(required = false, defaultValue = "") String address2,
					HttpServletRequest request) throws IOException {
		
		String nPass = oldPass;
		if(pass != null && !pass.isEmpty()) nPass = pass;
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email = mail + domain;
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		
		BusinessUser user = new BusinessUser();
		user.setBusinessId(businessId);
		user.setPass(nPass);
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
		
		if(multi != null && !multi.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID(); 
			String saveName = uid.toString() + "_" + multi.getOriginalFilename();
			File file = new File(filePath, saveName);
			multi.transferTo(file);
			user.setBusinessProfile(saveName);
		}
		
		service.businessUserInfoUpdate(user);
		
		return "redirect:/businessUserStoreInfo?id=testBusinessId";
	}	

	@RequestMapping(value="/normalUserInfoUpdate", method = RequestMethod.GET)
	public String normalUserInfoUpdate(Model model, String id) {
		model.addAttribute("NormalUser", service.getNormalUserInfo(id));
		
		return "sehwa/normalUserInfoUpdate";
	}
	
	@RequestMapping(value="/normalUserInfoUpdate", method = RequestMethod.POST)
	public String normalUserInfoUpdate(String normalId, String name, String nickName, 
							String oldPass, @RequestParam(required = false) String pass,
							int birth1, int birth2, int birth3, 
							String mobile1, String mobile2, String mobile3, String mail, String domain,
							int postNum, String address1, @RequestParam(required = false) String address2, 
							@RequestParam(value="fileInput", required=false) MultipartFile multi,
							HttpServletRequest request, HttpSession session) throws IOException {

		String nPass = oldPass;
		if(pass != null && !pass.isEmpty()) nPass = pass;
		String birth = birth1 + "-" + birth2 + "-" + birth3;
		String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
		String email = mail + domain;
		
		NormalUser user = new NormalUser();
		user.setNormalId(normalId);
		user.setName(name);
		user.setNickName(nickName);
		user.setPass(nPass);
		user.setBirth(birth);
		user.setMobile(mobile);
		user.setEmail(email);
		user.setPostNum(postNum);
		user.setAddress1(address1);
		user.setAddress2(address2);
		
		if(multi != null && !multi.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multi.getOriginalFilename();
			File file = new File(filePath, saveName);
			multi.transferTo(file);
			user.setProfile(saveName);
		} 
		
		service.normalUserInfoUpdate(user);
		
		session.setAttribute("NormalUser", service.getNormalUserInfo(normalId));
		
		return "redirect:/normalUserInfoUpdate?id=" + normalId;
	}
	
	@RequestMapping(value="/changeDefaultImg.ajax", method=RequestMethod.POST)
	@ResponseBody
	public void changeDefaultImg(String id, String type) {
		service.changeDefaultImg(id, type);
	}
	
	@RequestMapping(value={"/businessUserStoreInfo"}, method=RequestMethod.GET)
	public String businessUserStoreInfo(Model model, String id) {
		model.addAttribute("BusinessUser", service.getBusinessUserInfo(id));
		// 업종 셀렉트
		List<BusinessSectors> list = service.getBusinessSectors(id);
		String secNum = "";
		for(int i=0; i <list.size(); i++) {
			secNum += list.get(i).getSectorsNo();
		}
		model.addAttribute("secNum", secNum);

		return "forward:/WEB-INF/views/sehwa/businessUserStoreInfo.jsp";
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
	public void storeSectorUpdateBtn(String id, int count, String sectors) {
		String[] strArr = sectors.split(", ");
		int[] intArr = new int[strArr.length];
		for(int i=0; i<= count-1; i++) {
			intArr[i] = Integer.parseInt(strArr[i]);
		}
		service.storeSectorUpdate(id, count, intArr);
	}
	
	@RequestMapping(value= {"/noramlUserBookingList"}, method=RequestMethod.GET)
	public String noramlUserBookingList(Model model, String id,
			@RequestParam(value="pageNum", required = false, defaultValue = "1") int pageNum) {
		// 현재 예약내역
		model.addAllAttributes(service.getCurrentBooking(id));
		// 지난 예약내역
		model.addAllAttributes(service.getPastBooking(id, pageNum));
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

		if(multi != null && !multi.isEmpty()) {
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multi.getOriginalFilename();
			File file = new File(filePath, saveName);
			multi.transferTo(file);
			review.setReviewPicture(saveName);
		}

		service.insertReview(review);
		
		return "redirect:/noramlUserBookingList?id=" + reviewNormalUser;
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
	
	@RequestMapping(value="/visitantBlind.ajax", method=RequestMethod.POST)
	@ResponseBody
	public void visitantBlind(String id, int no) {
		service.visitantBlind(id, no);
	}
	
	@RequestMapping(value="/deleteReview")
	public String deleteReview(int no, String id) {
		service.deleteReview(no);
		return "redirect:/noramlUserBookingList?id=" + id;
	}

	@RequestMapping(value="/chargePoint")
	public String chargePoint() {
		return "sehwa/chargePoint";
	}
	
	@RequestMapping(value="/rechargePoint.ajax", method = RequestMethod.POST)
	@ResponseBody
	public void rechargePoint(String id, String payment, int amount, int point,HttpSession session) {
		service.rechargePoint(id, payment, amount, point);
		// 세션업데이트
		session.setAttribute("NormalUser", service.getNormalUserInfo(id));
	}
	
	@RequestMapping("/pointList")
	public String pointList(Model model, String id,
			@RequestParam(value="chargePageNum", required = false, defaultValue = "1") int chargePageNum,
			@RequestParam(value="usePageNum", required = false, defaultValue = "1") int usePageNum) {
		// 충전내역 가져오기
		model.addAllAttributes(service.chargePointList(id, chargePageNum));
		// 사용내역 가져오기
		model.addAllAttributes(service.usePointList(id, usePageNum));
		return "sehwa/noramlUserPointList";
	}
	
	@RequestMapping(value="/businessUserSecession")
	public String businessUserSecession(Model model, String id) {
		model.addAttribute("id", id);
		return "forward:/WEB-INF/views/sehwa/businessUserSecession.jsp";
	}
	
	@RequestMapping(value="/businessUserSecession.ajax", method = RequestMethod.POST)
	@ResponseBody
	public void businessUserSecession(String id) {
		service.deleteBusinessUser(id);
	}
	
	@RequestMapping(value="/normalUsesrSecession")
	public String normalUserSecession(Model model, String id) {
		model.addAttribute("id", id);
		return "sehwa/normalUserSecession";
	}
	
	@RequestMapping(value="/normalUsesrSecession.ajax", method=RequestMethod.POST)
	@ResponseBody
	public void normalUserSecession(String id) {
		service.deleteNormalUser(id);
	}
	
	@RequestMapping("/storeOpen")
	public String storeOpen(String id, HttpSession session) {
		BusinessUser user = service.getBusinessUserInfo(id);
		user.setStoreOnoff("open");
		
		session.setAttribute("BusinessUser", user);
		return "redirect:/businessUserStoreInfo?id=testBusinessId";
	}
	
	@RequestMapping("/storeClose")
	public String storeClose(String id, HttpSession session) {
		BusinessUser user = service.getBusinessUserInfo(id);
		user.setStoreOnoff("close");
		
		session.setAttribute("BusinessUser", user);
		return "redirect:/businessUserStoreInfo?id=testBusinessId";
	}
	
	
	
	
	
}
