package com.nosolorice.app.hyundao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.normalUser.UserInquiry;

@Repository
public class UserDaoImpl implements UserDao {

	private static final String NAME_SPACE = "com.nosolorice.app.mapper.UserMapper";
	
	private SqlSessionTemplate sqlSession;
	@Autowired
	public UserDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void writeUserInquiry(UserInquiry userInquiry) {
		sqlSession.insert(NAME_SPACE + ".writeUserInquiry", userInquiry);
	}
	@Override
	public List<UserInquiry> getUserInquiryList(int start, int pageSize, String normalId) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		params.put("normalId", normalId);
		return sqlSession.selectList(NAME_SPACE + ".getUserInquiry", params);
	}
	@Override
	public int getUserInquiryListCount(String normalId) {
		Map<String, String> params = new HashMap<>();
		params.put("normalId", normalId);
		return sqlSession.selectOne(NAME_SPACE + ".getUserInquiryListCount", params);
	}
	
}
