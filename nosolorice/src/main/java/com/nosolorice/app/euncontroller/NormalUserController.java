package com.nosolorice.app.euncontroller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.eunservice.NormalUserService;


import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Balance;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.model.StorageType;
import net.nurigo.sdk.message.request.MessageListRequest;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.MessageListResponse;
import net.nurigo.sdk.message.response.MultipleDetailMessageSentResponse;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.RestController;

@Controller
@SessionAttributes("normalUser")
public class NormalUserController {
	
	private NormalUserService normalUserService;
	
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
	@RequestMapping(value="/getNormalPhoneCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> getNormalPhoneCheck(String phone) throws CoolsmsException {
		
		String certNum =  normalUserService.normalPhoneCheck(phone);
		
		Map<String, String> result = new HashMap<>();
		
		result.put("certNum", certNum);
		
		
		// 인증번호 저장
		
		
		return result;
	}
	
	// 문자인증 번호 비교
		
		public @ResponseBody String normalPhoneCheck(@RequestParam(value="to") String to) throws CoolsmsException {			
			return normalUserService.normalPhoneCheck(to);
		}
    
}