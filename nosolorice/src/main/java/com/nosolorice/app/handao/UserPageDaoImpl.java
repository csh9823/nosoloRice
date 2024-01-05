package com.nosolorice.app.handao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ReportDetails>userReportList(int start,int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("num", num);
	
		
		return sqlSession.selectList(Mapper + ".userReportList");
	}

	@Override
	public List<BlockHistory>blockList(int start,int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("num", num);
	
		
		return sqlSession.selectList(Mapper+".blockList");
	}

	@Override
	public int getUserReportCount() {
		
		return sqlSession.selectOne(Mapper + ".getUserReportCount");
	}

	@Override
	public int getBlockCount() {
		
		return sqlSession.selectOne(Mapper + ".getBlockCount");
	}
	

}
