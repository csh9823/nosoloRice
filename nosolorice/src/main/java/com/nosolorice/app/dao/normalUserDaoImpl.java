package com.nosolorice.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.normalUser.NormalUser;

@Repository
public class normalUserDaoImpl implements normalUserDao {

	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.nosolorice.mapper.normalUserMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addNormalUser(NormalUser normalUser) {
		sqlSession.insert(NAME_SPACE + ".addNoramlUser", normalUser);
	}

	@Override
	public NormalUser getNormalId(String normalId) {
		return null;
	}

}
