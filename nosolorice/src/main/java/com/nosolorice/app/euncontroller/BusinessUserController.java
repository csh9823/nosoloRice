package com.nosolorice.app.euncontroller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.eunservice.BusinessUserService;
import com.nosolorice.app.eunservice.BusinessUserServiceImpl;

@Controller
@SessionAttributes("businessUser")
public class BusinessUserController {
	
	@Autowired
	private BusinessUserService businessUserService;
	
	@Autowired
	private BusinessUserServiceImpl businessUserServiceImpl;
	
	private static final String DEFAULT_PATH = "resources/upload";
	
	@Autowired
	public void setBusinessService(BusinessUserService businessUserService) {
		this.businessUserService = businessUserService;
	}
	
	@RequestMapping("/businessJoin")
    public String businessJoinForm(Model model) {

        return "member/businessJoinForm"; 
    }
	
	// 회원가입 완료 _사업자번호와 계좌번호가 long으로 바뀌어서 db도 int가 아닌 BigInt로 타입 바꿔줘야함
	@RequestMapping("/businessJoinResult")
	public String businessJoinResult(Model model, HttpServletRequest req,
			@RequestParam("businessId")String businessId, 
			@RequestParam("bPass")String pass, 
			@RequestParam("businessUserName")String name, 
			@RequestParam("callPhone")String phone,
			@RequestParam("businessNumber")long businessNumber, 
			@RequestParam("bName")String businessName, 
			@RequestParam("businessProfile")MultipartFile businessProfile, 
			@RequestParam("bEmail")String email, 
			@RequestParam("bPhone")String mobile,
			@RequestParam("zipcode") int postNum, 
			@RequestParam("address1")String address1, 
			@RequestParam("address2")String address2, String xpoint, String ypoint, 
			@RequestParam("bankcode")String bankName, 
			@RequestParam("accountNumber")long bankNumber, 
			@RequestParam("businessRegImg")MultipartFile businessPicture,
			@RequestParam("okNoOk")String okNoOk, 
			@RequestParam("root")int root) throws IOException {

		BusinessUser businessUser = new BusinessUser();
		System.out.println("businessId : " + businessId);

        businessUser.setBusinessId(businessId);
        businessUser.setPass(pass);
        System.out.println("pass : " + pass);
        businessUser.setName(name);
        businessUser.setPhone(phone);
        businessUser.setBusinessNumber(businessNumber);
        businessUser.setBusinessName(businessName);
        businessUser.setMobile(mobile);
        businessUser.setPostNum(postNum);
        businessUser.setAddress1(address1);
        businessUser.setAddress2(address2);
        businessUser.setXpoint(xpoint);
        businessUser.setYpoint(ypoint);

        businessUser.setEmail(email);
        businessUser.setBusinessNumber(businessNumber);
        
        businessUser.setBankName(bankName);
        businessUser.setBankNumber(bankNumber);

        // 이미지들
        if(!businessProfile.isEmpty() && !businessPicture.isEmpty()) {
        	String regfilePath = req.getServletContext().getRealPath(DEFAULT_PATH);
        	String profilePath = req.getServletContext().getRealPath(DEFAULT_PATH);
        	
        	UUID regUid = UUID.randomUUID();
        	UUID profileUid = UUID.randomUUID();
        	
        	String regNewName = regUid.toString() + "_" + businessProfile.getOriginalFilename();
        	String profileNewName = profileUid.toString() + "_" + businessPicture.getOriginalFilename();
        	
        	File regFile = new File(regfilePath, regNewName);
        	File proFile = new File(profilePath, profileNewName);
        	
        	businessPicture.transferTo(regFile);
        	businessProfile.transferTo(proFile);
        	
        	businessUser.setBusinessPicture(regNewName);
        	businessUser.setBusinessProfile(profileNewName);
        } else if(businessProfile.isEmpty() && !businessPicture.isEmpty()) {
        	// 기본프로필이미지 등록
        	String defaultImagePath = DEFAULT_PATH+"profile_img.png";
        	System.out.println("사업자_기본프로필 등록완료! : " + defaultImagePath);
        	businessUser.setBusinessProfile(defaultImagePath);
        	
        	// 사업자등록증이미지 등록
        	String regfilePath = req.getServletContext().getRealPath(DEFAULT_PATH);
        	UUID regUid = UUID.randomUUID();
        	String regNewName = regUid.toString() + "_" + businessPicture.getOriginalFilename();
        	File regFile = new File(regfilePath, regNewName);
        	businessPicture.transferTo(regFile);
        	businessUser.setBusinessPicture(regNewName);
        	
        }        

        businessUserService.addBusinessUser(businessUser);
        businessUserService.addJoinApprove(businessId);

        // 사업자도 회원가입 후 무조건 로그인이여야 하는가
        return "redirect:login";
    }

    // 중복체크
    @RequestMapping("/businessOverlapIdCheck")
    public String overlapBusinessIdCheck(Model model, String businessId) {
        boolean overlap = businessUserService.overlapBusinessIdCheck(businessId);
        System.out.println("컨트롤러 : " + overlap);

        model.addAttribute("businessId", businessId);
        model.addAttribute("businessOverlap", overlap);

        // 임시경로 지정~~
        return "member/businessOverlapIdCheck";
    }
    
    // 사업자번호 중복
    @RequestMapping("businessNumberOverlapCheck")
    @ResponseBody
    public boolean businessNumberOverlapCheck(Model model, long businessNumber) {
    	int overlap = businessUserService.overlapBusinessNumberCheck(businessNumber);
    	
    	System.out.println("(controller)overlap " + overlap + ". businessNumber " + businessNumber);
    	
    	model.addAttribute("overlap", overlap);
    	model.addAttribute("businessNumber", businessNumber); 
    	return overlap > 0;
    }
    

	// 문자인증번호 전송
	@RequestMapping("getBusinessPhoneCheck") 	
	@ResponseBody
	public Map<String, String> getBusinessPhoneCheck(String bPhone){
		String businessNumStr = businessUserService.certNum();
		
		System.out.println("컨트롤러 : " + businessNumStr);
		
		// normalUserServiceImpl.normalPhoneCheck(phone,numStr);
		
		// 인증번호 저장
		Map<String, String> result = new HashMap<>();
		result.put("certNum", businessNumStr);
		
		return result;
	}
}
