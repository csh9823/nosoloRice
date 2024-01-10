package com.nosolorice.app.eundao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.businessUser.BusinessUser;

@Repository
public class BusinessUserDaoImpl implements BusinessUserDao {

	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.nosolorice.mappers.BusinessUserMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public void addBusinessUser(BusinessUser businessUser) {
		sqlSession.insert(NAME_SPACE + ".addBusinessUser", businessUser);
	}


	@Override
	public List<String> getBusinessUser(String businessId) {
		return sqlSession.selectList(NAME_SPACE + ".getBusinessUser", businessId);
	}
	
	@Override
	public int overlapBusinessNumberCheck(long businessNumber) {
		System.out.println("(dao)businessNumber : " + businessNumber);
		int count = sqlSession.selectOne(NAME_SPACE + ".getBusinessNumber", businessNumber);
		System.out.println("dao_count : " + count);
	    return count;
	    
	}
	
	@Override
	public BusinessUser getBusinessId(String businessId) {
		return sqlSession.selectOne(NAME_SPACE + ".getBusinessId", businessId);
	}

}
