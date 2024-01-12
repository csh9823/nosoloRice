package com.nosolorice.app.jindao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.rootUser.RootUser;

@Repository
public class JinLoginDaoImpl implements JinLoginInterfaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mapper.loginMapper";
	
	@Override
	public BusinessUser loginBusinessUser(String id, String pass) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass",  pass);
		return sqlSession.selectOne(NAME_SPACE + ".loginBusinessUserv", map );
	}

	@Override
	public NormalUser loginNormalUser(String id, String pass) {
		System.out.println(id+":"+pass);
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass",  pass);
		return sqlSession.selectOne(NAME_SPACE + ".loginNormalUser", map );
	}
	
	
	public RootUser loginRootUser(String id, String pass) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass",  pass);
		return sqlSession.selectOne(NAME_SPACE + ".loginRootUser", map );
	}
	
	public String deniedUser(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".deniedUser", id );
	}
}
