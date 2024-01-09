package com.nosolorice.app.euncontroller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.eunservice.NormalUserService;
import com.nosolorice.app.eunservice.NormalUserServiceImpl;

@Controller
@SessionAttributes("normalUser")
public class NormalUserController {
	
	@Autowired
	private NormalUserService normalUserService;
	
	@Autowired
	private NormalUserServiceImpl normalUserServiceImpl;
	
	private static final String DEFAULT_PATH = "/resources/upload/normal_upload";
	
	@Autowired
	public void setMemberService(NormalUserService normalUserService) {
		this.normalUserService = normalUserService;
	}

    
    // 회원가입 완료
    @RequestMapping("/normalJoinResult")
    public String normalJoinResult(
            Model model, HttpServletRequest req, NormalUser normalUser, String pass, String mobile, String gender,
            @RequestPart("profileImageInput") MultipartFile profileImage,
            @RequestParam("year") String year, @RequestParam("month") String month, @RequestParam("day")String day,
            @RequestParam("zipcode") int postNum, String address1, String address2, String xpoint, String ypoint, int mypoint, String emailId, String emailDomain) throws IOException {

    	System.out.println(profileImage);
    	System.out.println(mypoint);
    	System.out.println(postNum);
    	System.out.println("이메일 :" + emailDomain);
    	
        normalUser.setPass(pass);
      
        normalUser.setEmail(emailId + "@" +emailDomain);
        
        System.out.println(emailId);
        
        String birth = year + "-" + month + "-" + day;
        normalUser.setBirth(birth);

        normalUser.setGender(gender);	
        System.out.println(gender);
        
        if(!profileImage.isEmpty()) {
        	String filePath = req.getServletContext().getRealPath(DEFAULT_PATH);
        	
        	UUID uid = UUID.randomUUID();
        	
        	String newName = uid.toString() + "_" + profileImage.getOriginalFilename();
        	
        	File file = new File(filePath, newName);
        	
        	profileImage.transferTo(file);
        	
        	normalUser.setProfile(newName);
        } else {
        	String defaultImagePath = "/resources/upload/normal_upload/profile_img.png";
        	System.out.println("이용자_기본프로필 등록완료! : " + defaultImagePath);
        	normalUser.setProfile(defaultImagePath);
        }

        normalUserService.addNormalUser(normalUser);

        return "login/login"; // 경로 수정
    }

    @RequestMapping("/overlapIdCheck")
    public String overlapIdCheck(Model model, String normalId) {
        boolean overlap = normalUserService.overlapIdCheck(normalId);

        model.addAttribute("normalId", normalId);
        model.addAttribute("overlap", overlap);

        return "member/overlapIdCheck";
    }

    // 닉네임 중복
    @RequestMapping(value = "/nickOverlapCheck", method = {RequestMethod.POST, RequestMethod.GET})
    public String nickOverlapCheck(Model model, String nickName) {
        boolean overlap = normalUserService.overlapNickCheck(nickName);
        
        System.out.println("overlap " + overlap + ", nickName " + nickName);
        
        model.addAttribute("overlap", overlap);
        model.addAttribute("nickName", nickName);
        return "member/nickOverlapCheck";
    }


	// 문자인증번호 전송
	@RequestMapping("getNormalPhoneCheck")
	@ResponseBody
	public Map<String, String> getNormalPhoneCheck(String mobile){
		String numStr = normalUserService.certNum();
		
		System.out.println("컨트롤러 : " + numStr);
		
		// normalUserServiceImpl.normalPhoneCheck(phone,numStr);
		
		// 인증번호 저장
		Map<String, String> result = new HashMap<>();
		result.put("certNum", numStr);
		
		return result;
	}
    
}