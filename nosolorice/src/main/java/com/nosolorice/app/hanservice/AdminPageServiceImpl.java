package com.nosolorice.app.hanservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.handao.AdminPageDao;
import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
@Service
public class AdminPageServiceImpl implements AdminPageService {
	
	private AdminPageDao adminPageDao;
	
	private static final int PS = 10;
	
	private static final int PG = 10;
	
	
	@Autowired
	public AdminPageServiceImpl(AdminPageDao adminPageDao) {
	
		this.adminPageDao = adminPageDao;
	}

	@Override
	public Map<String,Object> reportList(int pageNum) {
		
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PS;
		
		int listCount = 0;
		
		
		List<ReportDetails> adminReportList = adminPageDao.reportList(start, PS);
		
		int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);
	
		int startPage = (currentPage / PG ) * PG + 1 
				- (currentPage % PG == 0 ? PG : 0);
		
		int endPage = startPage + PG - 1;
		
		if(endPage > pageCount) {
			
			endPage = pageCount;
		}
		
		Map<String,Object> reportMap = new HashMap<String,Object>();
		
		reportMap.put("adminReportList", adminReportList);
		reportMap.put("pageCount", pageCount);
		reportMap.put("startPage", startPage);
		reportMap.put("endPage", endPage);
		reportMap.put("listCount", listCount);
		reportMap.put("PG", PG);
		

		return reportMap;
	}

	@Override
	public ReportDetails getReport(int reportNo) {
		
		return adminPageDao.getReport(reportNo);
	}

	@Override
	public Map<String,Object> reviewList(int pageNum) {
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PS;
		
		int listCount = 0;
		
		
		List<Review> adminReviewList = adminPageDao.reviewList(start, PS);
		
		int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);
	
		int startPage = (currentPage / PG ) * PG + 1 
				- (currentPage % PG == 0 ? PG : 0);
		
		int endPage = startPage + PG - 1;
		
		if(endPage > pageCount) {
			
			endPage = pageCount;
		}
		
		Map<String,Object> reviewMap = new HashMap<String,Object>();
		
		reviewMap.put("adminReviewList", adminReviewList);
		reviewMap.put("pageCount", pageCount);
		reviewMap.put("startPage", startPage);
		reviewMap.put("endPage", endPage);
		reviewMap.put("listCount", listCount);
		reviewMap.put("PG", PG);
		

		return reviewMap;
	}

	@Override
	public Review getReview(int reviewNo) {
		
		return adminPageDao.getReview(reviewNo);
	}

	@Override
	public Map<String,Object> deniedList(int pageNum) {
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PS;
		
		int listCount = 0;
		
		
		List<DeniedUser> deniedList = adminPageDao.deniedList(start, PS);
		
		int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);
	
		int startPage = (currentPage / PG ) * PG + 1 
				- (currentPage % PG == 0 ? PG : 0);
		
		int endPage = startPage + PG - 1;
		
		if(endPage > pageCount) {
			
			endPage = pageCount;
		}
		
		Map<String,Object> deniedMap = new HashMap<String,Object>();
		
		deniedMap.put("deniedList", deniedList);
		deniedMap.put("pageCount", pageCount);
		deniedMap.put("startPage", startPage);
		deniedMap.put("endPage", endPage);
		deniedMap.put("listCount", listCount);
		deniedMap.put("PG", PG);
		

		return deniedMap;
	}

	@Override
	public boolean searchId(String id) {
		
		String result = adminPageDao.searchId(id);
		
		  if (result != null && result.length() > 0) {
		  
		  return true; 
		  
		  }

		return false;
	}

	@Override
	public void addDenied(String id, String reason, int day) {
		
		adminPageDao.addDenied(id,reason,day);
	}
	
	

}
