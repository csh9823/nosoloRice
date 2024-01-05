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
	private BusinessUserServiceImpl businessUserServiceImpl;
	
	private static final String REG_DEFAULT_PATH = "/resources/upload/business_upload";
	private static final String DEFAULT_PATH = "/resources/upload/business_profile";
	
	@Autowired
	public void setBusinessService(BusinessUserService businessUserService) {
		this.businessUserService = businessUserService;
	}
	
	// 회원가입 완료 - 여기 작성 다 안됨 수정해주세욘 미래의 나야
	@RequestMapping(value = "/businessJoinResult")
    public String businessJoinResult(
            Model model, HttpServletRequest req, BusinessUser businessUser, String pass1,
            @RequestParam("businessProfileImage") MultipartFile businessProfileImage, @RequestParam("businessRegImg") MultipartFile businessPicture) throws IOException {

        businessUser.setPass(pass1);

        // 이미지들
        if(!businessProfileImage.isEmpty() && !businessPicture.isEmpty()) {
        	String regfilePath = req.getServletContext().getRealPath(REG_DEFAULT_PATH);
        	String profilePath = req.getServletContext().getRealPath(DEFAULT_PATH);
        	
        	UUID regUid = UUID.randomUUID();
        	UUID profileUid = UUID.randomUUID();
        	
        	String regNewName = regUid.toString() + "_" + businessProfileImage.getOriginalFilename();
        	String profileNewName = profileUid.toString() + "_" + businessPicture.getOriginalFilename();
        	
        	File regFile = new File(regfilePath, regNewName);
        	File proFile = new File(profilePath, profileNewName);
        	
        	businessProfileImage.transferTo(regFile);
        	businessPicture.transferTo(proFile);
        	
        	businessUser.setBusinessProfile(regNewName);
        	businessUser.setBusinessPicture(profileNewName);
        }

        businessUserService.addBusinessUser(businessUser);

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
    public boolean businessNumberOverlapCheck(Model model, Integer businessNumber) {
    	Integer overlap = businessUserService.overlapBusinessNumberCheck(businessNumber);
    	
    	System.out.println("overlap " + overlap + ". businessNumber " + businessNumber);
    	
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
