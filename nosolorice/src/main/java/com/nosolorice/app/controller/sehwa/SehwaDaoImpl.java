package com.nosolorice.app.controller.sehwa;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.businessUser.BusinessUser;

@Repository
public class SehwaDaoImpl implements SehwaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mappers.sehwa";

	@Override
	public BusinessUser getBusinessUserInfo(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getBusinessUserInfo", id);
	}

	@Override
	public void businessUserInfoUpdate(String id, BusinessUser user) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("user", user);	
		
		sqlSession.update(NAME_SPACE + ".businessUserInfoUpdate", params);
	}
	
	
	
	
	
	
	
	
}
