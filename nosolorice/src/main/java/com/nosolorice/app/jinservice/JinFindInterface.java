package com.nosolorice.app.jinservice;

public interface JinFindInterface {
	
	// 사업자 아이디 존재 확인
	abstract public String IdFindbusiness (String id);
	
	// 사용자 아이디 존재 확인
	abstract public String IdFindnormal (String id);
	
	// 사업자 아이디 비밀번호 변경
	abstract public void newpassbusiness (String id,String pass);
	
	// 일반 사용자 아이디 비밀번호 변경
	abstract public void newpassnormal (String id, String pass);
}
