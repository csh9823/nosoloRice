package com.nosolorice.app.hyundao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingOkMonth;
import com.nosolorice.app.domain.businessUser.BusinessInquiry;

@Repository
public class BusinessDaoImpl implements BusinessDao {

	private static final String NAME_SPACE = "com.nosolorice.app.mapper.BusinessMapper";
	
	private SqlSessionTemplate sqlSession;
	@Autowired
	public BusinessDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public void writeBusinessInquiry(BusinessInquiry businessInquiry) {
		System.out.println("다오에서 writeBusinessInquiry에서 : " + businessInquiry);
		sqlSession.insert(NAME_SPACE + ".writeBusinessInquiry", businessInquiry);
	}
	@Override
	public List<BusinessInquiry> getBusinessInquiryList(int start, int pageSize, String businessId) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		params.put("businessId", businessId);
		return sqlSession.selectList(NAME_SPACE + ".getBusinessInquiry", params);
	}
	@Override
	public int getBusinessInquiryListCount(String businessId) {
		Map<String, String> params = new HashMap<>();
		params.put("businessId", businessId);
		return sqlSession.selectOne(NAME_SPACE + ".getBusinessInquiryListCount", params);
	}

	@Override
	public List<BookingOk> getDailySalesList(int start, int pageSize, String businessId) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		params.put("businessId", businessId);
		return sqlSession.selectList(NAME_SPACE + ".getDailySalesList", params);
	}
	
	@Override
	public List<BookingOkMonth> getMonthlySalesList(int start, int pageSize, String businessId) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		params.put("businessId", businessId);
		return sqlSession.selectList(NAME_SPACE + ".getMonthlySalesList", params);
	}

	@Override
	public int getDailySalesListCount(String businessId) {
		Map<String, String> params = new HashMap<>();
		params.put("businessId", businessId);
		return sqlSession.selectOne(NAME_SPACE + ".getDailySalesListCount", params);
	}
	@Override
	public int getMonthlySalesListCount(String businessId) {
		Map<String, String> params = new HashMap<>();
		params.put("businessId", businessId);
		return sqlSession.selectOne(NAME_SPACE + ".getMonthlySalesListCount", params);
	}
	
}
