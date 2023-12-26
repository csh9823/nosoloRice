package com.nosolorice.app.eunservice;

import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.eundao.normalUserDao;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	public String normalPhoneCheck(String to) throws CoolsmsException {
		String api_key = "NCS9KK7TUTOME4MO";
		String api_secret = "PTWS3OHSRCMQFQRNYHJOHHJAQ6NSQCUM";
		Message coolsms = new Message(api_key, api_secret);
		
		Random rnd = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
            String ran = Integer.toString(rnd.nextInt(10));
            numStr += ran;
		}
		
		HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to);    // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
	    params.put("from", "01040969353");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨_임시로 제거 넣엇어욘
	    params.put("type", "sms"); 
	    params.put("text", "혼밥싫어 인증번호는 [" + numStr + "] 입니다.");
	    
	    
	    System.out.println(params);
	    // coolsms.send(params);
	    
	    return numStr;
	}
}
