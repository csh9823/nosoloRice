package com.nosolorice.app.controller.sehwa;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class SMSController {

	final DefaultMessageService messageService;

    public SMSController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSJVKSXY5RG42XZ", "S21PRXKAHV1CLHYZPEAAAUAHBPXNJBAY", "https://api.coolsms.co.kr");
    }
	
	@RequestMapping(value="/verifyNumSMS.ajax", method=RequestMethod.POST)
	@ResponseBody
    public Map<String, Object> sendOne(String mobile) {
		int num = ThreadLocalRandom.current().nextInt(100000);
		
		/*
        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01081313703");
        message.setTo(mobile);
        message.setText("[혼밥싫어]\n인증번호 [" + num + "]를 입력해주세요.");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        */
        
        Map<String, Object> resultMap = new HashMap<>();
        // resultMap.put("response", response);
        resultMap.put("num", num);
        
        return resultMap;
    }
	
}
