package com.nosolorice.app.eundao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.normalUser.NormalUser;

@Repository
public class normalUserDaoImpl implements normalUserDao {

	private SqlSessionTemplate sqlSession;
	
	private final String NAME_SPACE = "com.nosolorice.mappers.normalUserMapper";
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addNormalUser(NormalUser normalUser) {
		sqlSession.insert(NAME_SPACE + ".addNormalUser", normalUser);
	}

	@Override
    public List<String> getNormalUser(String normalId) {
		System.out.println("dao : "  +  normalId);
		return sqlSession.selectList(NAME_SPACE + ".getNormalUser", normalId);
    }

	@Override
	public boolean getNickName(String nickName) {
		int count = sqlSession.selectOne(NAME_SPACE + ".getNickName", nickName);
		boolean result = false;
		if(count > 0) {
			result = true;
		}
	    return result;
	}
	
	 @Override 
	 public NormalUser getNormalId(String normalId) { 
		 return sqlSession.selectOne(NAME_SPACE + ".getNormalId", normalId); 
	 }

}
