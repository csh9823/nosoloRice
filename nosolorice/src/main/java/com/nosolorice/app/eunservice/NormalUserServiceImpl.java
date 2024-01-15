package com.nosolorice.app.eunservice;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.eundao.BusinessUserDao;
import com.nosolorice.app.eundao.normalUserDao;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;



@Service
public class NormalUserServiceImpl implements NormalUserService {

	@Autowired
	private normalUserDao normalUserDao;
	/*
	 * @Autowired private BCryptPasswordEncoder passwordEncoder;
	 */

	@Override
    public boolean overlapIdCheck(String normalId) {
        List<String> normalUser = normalUserDao.getNormalUser(normalId);

        return normalUser.size() > 0 ? true : false;
    }

	@Override
	public boolean overlapNickCheck(String nickName) {
		return normalUserDao.getNickName(nickName); //false면 중복X, ture면 중복
	}
	
	@Override
	public void addNormalUser(NormalUser normalUser) {
		
	    if (normalUser.getPass() != null) {
			/* normalUser.setPass(passwordEncoder.encode(normalUser.getPass())); */
	    	normalUser.setPass(normalUser.getPass());
	    }

	    normalUserDao.addNormalUser(normalUser);
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
	public void normalPhoneCheck(String mobile, String numStr) {
		
		System.out.println("certifiedPhoneNumber" + mobile +"인증번호 : " + numStr);
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSJVKSXY5RG42XZ", "S21PRXKAHV1CLHYZPEAAAUAHBPXNJBAY", "https://api.coolsms.co.kr");
		 
		Message message = new Message();
		message.setFrom("01040969353");
		message.setTo(mobile);
		message.setText("인증번호는"+numStr+"입니다.");
	    
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
}
