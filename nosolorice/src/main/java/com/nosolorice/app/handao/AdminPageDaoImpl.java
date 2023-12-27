package com.nosolorice.app.handao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
@Repository
public class AdminPageDaoImpl implements AdminPageDao {
	
	private static final String Mapper = "com.nosolorice.app.mapper.AdminPageMapper";
	
	private SqlSessionTemplate sqlSession;
	
	
	
	@Autowired
	public AdminPageDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReportDetails> reportList(int start,int num) {
		
		return sqlSession.selectList(Mapper +".reportList");
	}

	@Override
	public ReportDetails getReport(int reportNo) {
		
		return sqlSession.selectOne(Mapper +".ReportDetail");
	}

	@Override
	public List<Review> reviewList(int start,int num) {
	
		return sqlSession.selectList(Mapper +".reviewList");
	}

	@Override
	public Review getReview(int reviewNo) {
		
		return sqlSession.selectOne(Mapper + ".reviewDetail");
	}

	@Override
	public List<DeniedUser> deniedList(int start, int num) {
		
		return sqlSession.selectList(Mapper + ".deniedList");
	}

	@Override
	public String searchId(String id) {
		
		return sqlSession.selectOne(Mapper + ".searchId",id);
	}

	@Override
	public void addDenied(String id, String reason, int day) {
		
		Map <String,Object> map = new HashMap<String,Object>();
		
		map.put("id", id);
		map.put("reason", reason);
		map.put("day", day);
		

		sqlSession.insert(Mapper + ".addDenied",map);
		
	}

	@Override
	public void businessDelete(int businessNumber) {
		
		sqlSession.delete(Mapper + ".businessDelete",businessNumber);
		
	}

	@Override
	public int getReportCount() {
		
		return sqlSession.selectOne(Mapper + ".getReportCount");
	}
	
	

}
