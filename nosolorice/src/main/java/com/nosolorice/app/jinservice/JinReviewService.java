package com.nosolorice.app.jinservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.jindao.JinReviewDaoImpl;

@Service
public class JinReviewService implements JinReviewInterface {

	@Autowired
	JinReviewDaoImpl jinReviewDaoImpl;
	
	public List<Map<String, Object>> ReviewList (String businessId){
		
		return jinReviewDaoImpl.ReviewList(businessId);
	}
	
	public void Businessriviewblind(int revireNo) {
		jinReviewDaoImpl.Businessriviewblind(revireNo);
	}
	public void Businessriviewdelete(int revireNo) {
		jinReviewDaoImpl.Businessriviewdelete(revireNo);
	}
	
	public void Businessreviewadd(int reviewNo, String normalId, String businessId, String businessComment) {
		jinReviewDaoImpl.Businessreviewadd(reviewNo, normalId, businessId,businessComment);
	}
	
	public void OwnerCommentupdate(String businessComment2, int reviewNo) {
		jinReviewDaoImpl.OwnerCommentupdate(businessComment2, reviewNo);
	}
	
	public void OwnerCommentdelete(int reviewNo) {
		jinReviewDaoImpl.OwnerCommentdelete(reviewNo);
	}
	
	public String getreviewcoung(String businessId) {
		return jinReviewDaoImpl.getreviewcoung(businessId);
	}
}
