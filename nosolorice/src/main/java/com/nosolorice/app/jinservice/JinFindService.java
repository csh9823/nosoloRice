package com.nosolorice.app.jinservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.jindao.JinFindDaoImpl;

@Service
public class JinFindService implements JinFindInterface {

	@Autowired
	private JinFindDaoImpl jinFindDaoImpl;
	
	@Override
	public String IdFindbusiness(String id) {

		return jinFindDaoImpl.IdFindbusiness(id);
	}
	
	public String IdFindnormal (String id) {
		
		return jinFindDaoImpl.IdFindnormal(id);
	}
	
	// 사업자 아이디 비밀번호 변경
	public void newpassbusiness (String id,String pass) {
		
		jinFindDaoImpl.newpassbusiness(id, pass);
	}
	
	// 일반 사용자 아이디 비밀번호 변경
	public void newpassnormal (String id, String pass) {
		
		jinFindDaoImpl.newpassnormal(id, pass);
	}
	
	// 사업자 아이디 이름으로 존재 확인
	public String IdFindbusinessName (String name,String mobile) {
		return jinFindDaoImpl.IdFindbusinessName(name,mobile);
	}
	
	// 사용자 아이디 이름으로 존재 확인
	public String IdFindnormalName (String name,String mobile) {
		return jinFindDaoImpl.IdFindnormalName(name,mobile);
	}
}
