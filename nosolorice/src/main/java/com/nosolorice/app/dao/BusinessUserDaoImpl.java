package com.nosolorice.app.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.businessUser.BusinessUser;

@Repository
public class BusinessUserDaoImpl implements BusinessUserDao {

	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.nosolorice.mapper.businessUserMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public void addBusinessUser(BusinessUser businessUser) {
		sqlSession.insert(NAME_SPACE + ".addBusinessUser", businessUser);
	}


	@Override
	public boolean overlapBusinessIdCheck(String businessId) {
	    // db에서 사용자 조회
	    BusinessUser existingUser = sqlSession.selectOne(NAME_SPACE + ".getBusinessId", businessId);

	    // 있으면 true
	    return existingUser != null;
	}

}
