package com.nosolorice.app.handao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessInquiry;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
import com.nosolorice.app.domain.normalUser.UserInquiry;
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("start", start);
			map.put("num", num);
		
		return sqlSession.selectList(Mapper +".reportList",map);
	}

	@Override
	public ReportDetails getReport(int reportNo) {
		
		return sqlSession.selectOne(Mapper +".ReportDetail");
	}

	@Override
	public List<Review> reviewList(int start,int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("start", start);
			map.put("num", num);
	
			List<Review> rList = sqlSession.selectList(Mapper +".reviewList",map);
			
		return rList;
	}

	@Override
	public Review getReview(int reviewNo) {
		
		return sqlSession.selectOne(Mapper + ".reviewDetail");
	}

	@Override
	public List<DeniedUser> deniedList(int start, int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("start", start);
			map.put("num", num);
		
		return sqlSession.selectList(Mapper + ".deniedList",map);
	}

	@Override
	public NormalUser searchId(String id) {
		
		Map<String,Object> map = new HashMap<>();
		
		
		map.put("id",id);
		
		return sqlSession.selectOne(Mapper + ".searchId",map);
	}
	
	@Override
	public BusinessUser searchBusinessId(String id){

		return sqlSession.selectOne(Mapper + ".searchBusinessId",id);
		
	}

	@Override
	public void addDenied(String id, String reason, int day) {
		Map <String,Object> map = new HashMap<String,Object>();
		
		map.put("id", id);
		map.put("reason", reason);
		map.put("day", day);
		System.out.println("denied : " + id);
		

		sqlSession.insert(Mapper + ".addDenied",map);
		
	}


	@Override
	public int getReportCount() {
		
		return sqlSession.selectOne(Mapper + ".getReportCount");
	}

	@Override
	public void unlockUser(int deniedUserNo) {
	
		sqlSession.delete(Mapper + ".unlockUser",deniedUserNo);
		
	}

	@Override
	public List<BusinessUser> businessDeleteList(int start,int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("num", num);
		
		List<BusinessUser> list = sqlSession.selectList(Mapper + ".businessDeleteList",map);
	
			return list;
	}

	@Override
	public int getReviewCount() {
		
		return sqlSession.selectOne(Mapper + ".getReviewCount");
	}

	@Override
	public int getDeniedUserCount() {
		return sqlSession.selectOne(Mapper + ".getDeniedUserCount");
	}

	@Override
	public int getBusinessDeleteCount() {
		
		return sqlSession.selectOne(Mapper + ".getBusinessDeleteCount");
	}

	@Override
	public NormalUser normalUser(String id) {
	
		return sqlSession.selectOne(Mapper + ".getNormalUser",id);
	}

	@Override
	public void reviewDelete(int reviewNo) {
		sqlSession.delete(Mapper+".reviewDelete",reviewNo);
	}
	
	

	@Override
	public void businessDelete(String id) {

		sqlSession.delete(Mapper + ".businessDelete",id);
	}
	
	@Override
	public List<UserInquiry> adminNormalInquiryList(int start,int num) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("num", num);

		return sqlSession.selectList(Mapper + ".adminInquiryList",map);
	}

	@Override
	public UserInquiry getInquiry(int userInquiryNo) {
		
		return sqlSession.selectOne(Mapper + ".normalInquiryDetail",userInquiryNo);
	}

	@Override
	public int getInquiryCount() {
		
		return sqlSession.selectOne(Mapper + ".getInquiryCount");
	}
	
	@Override
	public void answerInquiry(UserInquiry userInquiry) {

		sqlSession.update(Mapper + ".answerInquiry",userInquiry);
		
	}

	@Override
	public List<BusinessInquiry> adminBusinessInquiryList(int start, int num) {
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("start", start);
		map.put("num", num);
		
		return sqlSession.selectList(Mapper + ".adminBusinessInquiryList",map);
	}

	@Override
	public int getBusinessInquiryCount() {
		
		return sqlSession.selectOne(Mapper + ".getBusinessInquiryCount");
	}

	@Override
	public BusinessInquiry getBusinessInquiry(int businessInquiryNo) {
		
		return sqlSession.selectOne(Mapper + ".businessInquiryDetail",businessInquiryNo);
	}

	@Override
	public void answerBusinessInquiry(BusinessInquiry businessInquiry) {
		
		sqlSession.update(Mapper + ".businessAnswerInquiry",businessInquiry);
		
	}

	@Override
	public void deleteOwnerComment(int reviewNo, String businessId) {
		Map<String,Object> map = new HashMap<>();
		
		map.put("reviewNo", reviewNo);
		map.put("businessId", businessId);
		sqlSession.delete(Mapper + ".deleteOwnerComment", map);		
	}





	
	

}
