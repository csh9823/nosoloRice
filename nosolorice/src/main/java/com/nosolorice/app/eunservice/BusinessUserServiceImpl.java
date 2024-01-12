package com.nosolorice.app.eunservice;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.eundao.BusinessUserDao;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class BusinessUserServiceImpl implements BusinessUserService {

	@Autowired
    private BusinessUserDao businessUserDao;
	
	/*
	 * @Autowired private BCryptPasswordEncoder passwordEncoder;
	 */

    @Override
    public boolean overlapBusinessIdCheck(String businessId) {
    	List<String> businessUser = businessUserDao.getBusinessUser(businessId);
    	System.out.println("service : " + businessUser.size());
        return businessUser.size() > 0 ? true : false;
    }
    
    @Override
    public int overlapBusinessNumberCheck(long businessNumber) {
    	System.out.println("서비스 : " + businessNumber);
        return businessUserDao.overlapBusinessNumberCheck(businessNumber);
    }
    
    @Override
    public void addBusinessUser(BusinessUser businessUser) {
    	if (businessUser.getPass() != null) {
			/* businessUser.setPass(passwordEncoder.encode(businessUser.getPass())); */
    		businessUser.setPass(businessUser.getPass());
		}
	
    	businessUserDao.addBusinessUser(businessUser);
	}
    
    @Override
	public String certNum() {
		Random rnd = new Random();
		StringBuilder numStr = new StringBuilder();
		
		for (int i = 0; i < 4; i++) {
            String ran = Integer.toString(rnd.nextInt(10));
            numStr.append(ran);
		}

		System.out.println("서비스 : " + numStr);
		
		return numStr.toString();
		
	}
    
    @Override
	public void businessPhoneCheck(String phone, String numStr) {
		
		System.out.println("certifiedPhoneNumber" + phone +"인증번호 : " + numStr);
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCS9KK7TUTOME4MO", "PTWS3OHSRCMQFQRNYHJOHHJAQ6NSQCUM", "https://api.coolsms.co.kr");
		 
		Message message = new Message();
		message.setFrom("01040969353");
		message.setTo(phone);
		message.setText("인증번호는 [ "+numStr+" ] 입니다.");
	    
		try {
			  messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {	
			  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			  System.out.println(exception.getFailedMessageList());
			  System.out.println(exception.getMessage());
			} catch (Exception exception) {
			  System.out.println(exception.getMessage());
			}
			   
		}

	@Override
	public void addJoinApprove(String businessId) {
		businessUserDao.joinApprove(businessId);
	}
   
}
