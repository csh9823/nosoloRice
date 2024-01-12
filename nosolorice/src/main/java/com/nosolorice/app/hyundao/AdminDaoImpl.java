package com.nosolorice.app.hyundao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingOkMonth;
import com.nosolorice.app.domain.businessUser.JoinApprove;

@Repository
public class AdminDaoImpl implements AdminDao {

	private static final String NAME_SPACE = "com.nosolorice.app.mapper.AdminMapper";
	
	private SqlSessionTemplate sqlSession;
	@Autowired
	public AdminDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List<JoinApprove> getJoinApproveList(int start, int pageSize) {
		Map<String, Integer> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);		
		return sqlSession.selectList(NAME_SPACE + ".getJoinApproveList", params);
	}
	@Override
	public int getJoinApproveListCount() {
		return sqlSession.selectOne(NAME_SPACE + ".getJoinApproveListCount");
	}
	@Override
	public void updateJoinApprove(long businessNumber) {
		System.out.println("ajax다오까지는 도착");
		sqlSession.update(NAME_SPACE + ".updateJoinApprove", businessNumber);
	}
	@Override
	public void deleteJoinApprove(int no) {
		sqlSession.delete(NAME_SPACE + ".deleteJoinApprove", no);
	}
	@Override
	public List<BookingOk> getDailySalesList(int start, int pageSize) {
		Map<String, Integer> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		return sqlSession.selectList(NAME_SPACE + ".getDailySalesList", params);
	}
	@Override
	public List<BookingOkMonth> getMonthlySalesList(int start, int pageSize) {
		Map<String, Integer> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		return sqlSession.selectList(NAME_SPACE + ".getMonthlySalesList", params);
	}

	@Override
	public int getDailySalesListCount() {
		return sqlSession.selectOne(NAME_SPACE + ".getDailySalesListCount");
	}
	@Override
	public int getMonthlySalesListCount() {
		return sqlSession.selectOne(NAME_SPACE + ".getMonthlySalesListCount");
	}

}
