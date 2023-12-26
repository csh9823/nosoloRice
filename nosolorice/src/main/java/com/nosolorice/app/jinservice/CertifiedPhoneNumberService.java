package com.nosolorice.app.jinservice;

import org.springframework.stereotype.Service;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class CertifiedPhoneNumberService {

public void certifiedPhoneNumber(String userPhoneNumber, String randomNumber) {
	
	System.out.println("certifiedPhoneNumber" + userPhoneNumber +"인증번호 : " + randomNumber);
	
	DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSIVSJN3C6HVSLW", "OPFRBZYTJSDMWW7BS4OFDHHR1TKS1IIT", "https://api.coolsms.co.kr");
	Message message = new Message();
	message.setFrom("01023269803");
	message.setTo(userPhoneNumber);
	message.setText("인증번호는"+randomNumber+"입니다.");

	
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
