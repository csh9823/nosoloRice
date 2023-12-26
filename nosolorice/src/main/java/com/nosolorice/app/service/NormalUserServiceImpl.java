package com.nosolorice.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nosolorice.app.dao.normalUserDao;
import com.nosolorice.app.domain.normalUser.NormalUser;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;



@Service
public class NormalUserServiceImpl implements NormalUserService {

	@Autowired
	private normalUserDao normalUserDao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public boolean overlapNormalIdCheck(String normalId) {
		NormalUser normalUser = normalUserDao.getNormalId(normalId);

		if(normalUser == null) {
			return false;
		}
		
		return true;
	}

	@Override
	public void addNormalUser(NormalUser normalUser) {
		String encodedPassword = passwordEncoder.encode(normalUser.getPass());
		normalUser.setPass(encodedPassword);

		normalUserDao.addNormalUser(normalUser);
	}
	
	@Override
	public void normalPhoneCheck(String phone, String numStr) {
		
		System.out.println("certifiedPhoneNumber" + phone +"인증번호 : " + numStr);
		
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCS9KK7TUTOME4MO", "PTWS3OHSRCMQFQRNYHJOHHJAQ6NSQCUM", "https://api.coolsms.co.kr");
		 
		Message message = new Message();
		message.setFrom("01040969353");
		message.setTo(phone);
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
