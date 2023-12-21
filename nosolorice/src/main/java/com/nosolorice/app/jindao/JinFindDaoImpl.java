package com.nosolorice.app.jindao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JinFindDaoImpl implements JinFindInterfaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mapper.FindMapper";
	
	// 사업자 아이디 존재 확인
	@Override
	public String IdFindbusiness(String id,String mobile) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("mobile", mobile);
		
		return sqlSession.selectOne(NAME_SPACE + ".IdFindbusiness",map);
	}
	
	// 사용자 아이디 존재 확인
	public String IdFindnormal (String id,String mobile) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("mobile", mobile);
		return sqlSession.selectOne(NAME_SPACE + ".IdFindnormal",map);
	};
	
	// 사업자 아이디 비밀번호 변경
	public void newpassbusiness (String id,String pass) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		sqlSession.update(NAME_SPACE + ".newpassbusiness", map);
	}
	
	// 일반 사용자 아이디 비밀번호 변경
	public void newpassnormal (String id, String pass) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		sqlSession.update(NAME_SPACE + ".newpassnormal", map);
		
	}
	
	// 사업자 아이디 이름으로 존재 확인
	public String IdFindbusinessName (String name,String mobile) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("mobile", mobile);
		
		return sqlSession.selectOne(NAME_SPACE + ".IdFindbusinessName",map);
	}
	
	// 사용자 아이디 이름으로 존재 확인
	public String IdFindnormalName (String name,String mobile) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("mobile", mobile);
		
		return sqlSession.selectOne(NAME_SPACE + ".IdFindnormalName",map);
	}
}
