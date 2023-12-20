package com.nosolorice.app.jindao;

public interface JinFindInterfaceDao {
	
	// 사업자 아이디 존재 확인
	abstract public String IdFindbusiness (String id);
	
	// 사용자 아이디 존재 확인
	abstract public String IdFindnormal (String id);
	
	// 사업자 아이디 이름으로 존재 확인
	abstract public String IdFindbusinessName (String name,String mobile);
	
	// 사용자 아이디 이름으로 존재 확인
	abstract public String IdFindnormalName (String name,String mobile);
	
	// 사업자 아이디 비밀번호 변경
	abstract public void newpassbusiness (String id,String pass);
	
	// 일반 사용자 아이디 비밀번호 변경
	abstract public void newpassnormal (String id, String pass);


}
