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
	
private static final String Mapper = "com.nosolorice.app.mapper.UserPageMapper";

	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public UserPageDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReportDetails>userReportList(String reporter,int start,int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("reporter", reporter);
		map.put("start", start);
		map.put("num", num);
	
		
		return sqlSession.selectList(Mapper + ".userReportList",map);
	}

	@Override
	public List<BlockHistory>blockList(String blocker,int start,int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("blocker",blocker);
		map.put("start", start);
		map.put("num", num);
	
		
		return sqlSession.selectList(Mapper+".blockList",map);
	}

	@Override
	public int getUserReportCount() {
		
		return sqlSession.selectOne(Mapper + ".getReportCount");
	}

	@Override
	public int getBlockCount() {
		
		int count = sqlSession.selectOne(Mapper + ".getBlockCount");
		
		System.out.println("dao에서---------------- : " + count);
		
		return count;
	}

	@Override
	public void blockUnlock(int blockHistoryNo) {

		sqlSession.delete(Mapper + ".blockUnlock",blockHistoryNo);
		
	}


}
