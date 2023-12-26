package com.nosolorice.app.handao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
@Repository
public class UserPageDaoImpl implements UserPageDao {
	
private static final String Mapper = "com.solorice.app.mapper.UserPageMapper";

	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public UserPageDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReportDetails>reportList() {
		
		return sqlSession.selectList(Mapper + ".reportList");
	}

	@Override
	public List<BlockHistory>blockList() {
		
		return sqlSession.selectList(Mapper+".blockList");
	}

}
