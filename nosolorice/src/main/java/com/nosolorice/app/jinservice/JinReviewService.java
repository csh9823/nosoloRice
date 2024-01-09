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
}
