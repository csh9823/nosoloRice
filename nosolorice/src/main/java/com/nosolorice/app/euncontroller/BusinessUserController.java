package com.nosolorice.app.euncontroller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.eunservice.BusinessUserService;

@Controller
@SessionAttributes("businessUser")
public class BusinessUserController {
	
	@Autowired
	private BusinessUserService businessUserService;
	
	@Autowired
	public void setBusinessService(BusinessUserService businessUserService) {
		this.businessUserService = businessUserService;
	}
	
	// 회원가입 완료
	@RequestMapping(value = "/businessJoinResult", method = RequestMethod.POST)
    public String businessJoinResult(
            Model model, BusinessUser businessUser, String pass1,
            @RequestParam("profileImage") MultipartFile profileImage) {

        businessUser.setPass(pass1);

        if (!profileImage.isEmpty()) {

            String profileImagePath = saveProfileImage(profileImage);
            businessUser.setBusinessProfile(profileImagePath);
        }

        businessUserService.addBusinessUser(businessUser);

        return "redirect:loginForm";
    }

    private String saveProfileImage(MultipartFile profileImage) {
        try {
            String uploadDir = "business_upload";  // 임의경로(business_upload)폴더 생성 후 거기에 저장
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

    // 중복체크
    @RequestMapping("/overlapBusinessIdCheck")
    public String overlapBusinessIdCheck(Model model, String businessId) {
        boolean overlap = businessUserService.overlapBusinessIdCheck(businessId);

        model.addAttribute("businessId", businessId);
        model.addAttribute("overlap", overlap);

        // 임시경로 지정~~
        return "forward:/WEB-INF/views/check.jsp";
    }
}
