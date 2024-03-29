package com.nosolorice.app.handao;

import java.util.List;

import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessInquiry;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
import com.nosolorice.app.domain.normalUser.UserInquiry;

public interface AdminPageDao {
	
	//신고 내역 리스트
	public abstract List<ReportDetails>reportList(int start,int num);
	//신고 상세
	public abstract ReportDetails getReport(int reportNo);
	//신고 글 수
	public abstract int getReportCount();
	//리뷰 리스트
	public abstract List<Review>reviewList(int start,int num);
	//리뷰 상세
	public abstract Review getReview(int reviewNo);
	//리뷰 수
	public abstract int getReviewCount();
	//정지 리스트
	public abstract List<DeniedUser> deniedList(int start,int num);
	//일반 아이디 검색
	public abstract NormalUser searchId(String id);
	//업체 아이디 검색
	public abstract BusinessUser searchBusinessId(String id);
	//정지 수
	public abstract int getDeniedUserCount();
	//정지 추가
	public abstract void addDenied(String id,String reason,int day);
	//업체 삭제 리스트
	public abstract List<BusinessUser> businessDeleteList(int start,int num);
	//업체 삭제
	public abstract void businessDelete(String id);
	//정지 해제
	public abstract void unlockUser(int deniedUserNo);
	
	public abstract int getBusinessDeleteCount();

	public abstract NormalUser normalUser(String id);
	//리뷰  삭제 요청
	public abstract void reviewDelete(int reviewNo);
	//관리자 문의 관리
	public abstract List<UserInquiry>adminNormalInquiryList(int start,int num);
	
	public abstract int getInquiryCount();
	
	public abstract UserInquiry getInquiry(int userInquiryNo);
	
	public abstract void answerInquiry(UserInquiry userInquiry);
	
	public abstract List<BusinessInquiry> adminBusinessInquiryList(int start,int num);
	
	public abstract int getBusinessInquiryCount();
	
	public abstract BusinessInquiry getBusinessInquiry(int businessInquiryNo);

	public abstract void answerBusinessInquiry(BusinessInquiry businessInquiry);
	
	public abstract void deleteOwnerComment(int reviewNo, String businessId);
	
	
	
	
	
	
	
	

}
