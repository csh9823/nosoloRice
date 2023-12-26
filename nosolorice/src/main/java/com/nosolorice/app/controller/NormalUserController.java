package com.nosolorice.app.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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

import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.service.NormalUserService;
import com.nosolorice.app.service.NormalUserServiceImpl;

@Controller
@SessionAttributes("normalUser")
public class NormalUserController {
	
	@Autowired
	private NormalUserService normalUserService;
	
	@Autowired
	private NormalUserServiceImpl normalUserServiceImpl;
	
	@Autowired
	public void setMemberService(NormalUserService normalUserService) {
		this.normalUserService = normalUserService;
	}
	
	// 회원가입 완료
	@RequestMapping(value = "/normalJoinResult", method = RequestMethod.POST)
    public String normalJoinResult(
            Model model, NormalUser normalUser, String pass1,
            @RequestParam("profileImage") MultipartFile profileImage) {

        normalUser.setPass(pass1);

        if (!profileImage.isEmpty()) {

            String profileImagePath = saveProfileImage(profileImage);
            normalUser.setProfile(profileImagePath);
        }

        normalUserService.addNormalUser(normalUser);

        return "redirect:login";
    }

    private String saveProfileImage(MultipartFile profileImage) {
        try {
        	
            String uploadDir = "normal_upload";  // 임의경로(normal_upload)폴더 생성 후 거기에 저장
            String absolutePath = new File("").getAbsolutePath();
            String filePath = absolutePath + File.separator + uploadDir + File.separator;

            File directory = new File(filePath);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            String fileName = profileImage.getOriginalFilename();
            String fileFullPath = filePath + fileName;
            FileCopyUtils.copy(profileImage.getBytes(), new File(fileFullPath));

            return fileFullPath;
        } catch (IOException e) {

            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/overlapIdCheck")
    public String overlapNormalIdCheck(Model model, String normalId){
    	boolean overlap = normalUserService.overlapNormalIdCheck(normalId);

        model.addAttribute("normalId", normalId);
        model.addAttribute("overlap", overlap);
        
        return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
    }
    
    // 닉네임 중복
    @RequestMapping("/nickOverlapCheck")
    public String nickOverlapCheck(Model model, String nickName){
    	System.out.println("닉네임: " + nickName);
    	boolean overlap = normalUserService.overlapNormalIdCheck(nickName);

        model.addAttribute("nickName", nickName);
        model.addAttribute("overlap", overlap);
        
        return "forward:WEB-INF/views/member/nickOverlapCheck.jsp";
    }

	// 문자인증번호 전송
	@RequestMapping("getNormalPhoneCheck")
	@ResponseBody
	public Map<String, String> getNormalPhoneCheck(String phone){
		
		
		Random rnd = new Random();
		String numStr = "";
		
		for (int i = 0; i < 4; i++) {
            String ran = Integer.toString(rnd.nextInt(10));
            numStr += ran;
		}
		System.out.println(phone);
		System.out.println(numStr);
		
		// normalUserServiceImpl.normalPhoneCheck(phone,numStr);
		
		// 인증번호 저장
		Map<String, String> result = new HashMap<>();
		result.put("certNum", numStr);
		
		return result;
	}
    
}