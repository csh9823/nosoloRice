package com.nosolorice.app.hanservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.handao.AdminPageDao;
import com.nosolorice.app.domain.Review.Review;
import com.nosolorice.app.domain.businessUser.BusinessInquiry;
import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.DeniedUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.normalUser.ReportDetails;
import com.nosolorice.app.domain.normalUser.UserInquiry;

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
	public Map<String, Object> reportList(int pageNum) {

		int currentPage = pageNum;

		int start = (currentPage - 1) * PS;

		int listCount = 0;

		listCount = adminPageDao.getReportCount();

		if (listCount > 0) {

			List<ReportDetails> adminReportList = adminPageDao.reportList(start, PS);

			int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

			int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

			int endPage = startPage + PG - 1;

			if (endPage > pageCount) {

				endPage = pageCount;
			}

			Map<String, Object> reportMap = new HashMap<String, Object>();

			reportMap.put("adminReportList", adminReportList);
			reportMap.put("currentPage", currentPage);
			reportMap.put("pageCount", pageCount);
			reportMap.put("startPage", startPage);
			reportMap.put("endPage", endPage);
			reportMap.put("listCount", listCount);
			reportMap.put("PG", PG);

			return reportMap;
		} else {
			return null;
		}
	}

	@Override
	public ReportDetails getReport(int reportNo) {

		return adminPageDao.getReport(reportNo);
	}

	@Override
	public Map<String, Object> reviewList(int pageNum) {

		int currentPage = pageNum;

		int startRow = (currentPage - 1) * PS;
		int listCount = 0;

		listCount = adminPageDao.getReviewCount();

		if (listCount > 0) {

			List<Review> adminReviewList = adminPageDao.reviewList(startRow, PS);

			int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

			int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

			int endPage = startPage + PG - 1;

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			Map<String, Object> modelMap = new HashMap<String, Object>();

			modelMap.put("adminReviewList", adminReviewList);
			modelMap.put("currentPage", currentPage);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", PG);

			return modelMap;
		} else {
			return null;
		}

	}

	@Override
	public Review getReview(int reviewNo) {

		return adminPageDao.getReview(reviewNo);
	}

	@Override
	public Map<String, Object> deniedList(int pageNum) {

		int currentPage = pageNum;

		int start = (currentPage - 1) * PS;

		int listCount = 0;

		listCount = adminPageDao.getDeniedUserCount();

		List<DeniedUser> deniedList = adminPageDao.deniedList(start, PS);

		int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

		int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

		int endPage = startPage + PG - 1;

		if (endPage > pageCount) {

			endPage = pageCount;
		}

		Map<String, Object> deniedMap = new HashMap<String, Object>();

		deniedMap.put("deniedList", deniedList);
		deniedMap.put("currentPage", currentPage);
		deniedMap.put("pageCount", pageCount);
		deniedMap.put("startPage", startPage);
		deniedMap.put("endPage", endPage);
		deniedMap.put("listCount", listCount);
		deniedMap.put("PG", PG);

		return deniedMap;
	}

	@Override
	public NormalUser searchId(String id) {

		return adminPageDao.searchId(id);

	}

	@Override
	public BusinessUser searchBusinessId(String id) {
	  
	 
	 return adminPageDao.searchBusinessId(id);
	  
	 
	}
	 

	@Override
	public void addDenied(String id, String reason, int day) {

		adminPageDao.addDenied(id, reason, day);
	}

	@Override
	public Map<String, Object> businessDeleteList(int pageNum) {

		int currentPage = pageNum;

		int start = (currentPage - 1) * PS;

		int listCount = 0;

		listCount = adminPageDao.getBusinessDeleteCount();

		List<BusinessUser> bList = adminPageDao.businessDeleteList(start, PS);

		int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

		int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

		int endPage = startPage + PG - 1;

		if (endPage > pageCount) {

			endPage = pageCount;
		}

		Map<String, Object> businessDeleteMap = new HashMap<String, Object>();

		businessDeleteMap.put("bList", bList);
		businessDeleteMap.put("currentPage", currentPage);
		businessDeleteMap.put("pageCount", pageCount);
		businessDeleteMap.put("startPage", startPage);
		businessDeleteMap.put("endPage", endPage);
		businessDeleteMap.put("listCount", listCount);
		businessDeleteMap.put("PG", PG);

		return businessDeleteMap;

	}

	@Override
	public void businessDelete(String id) {

		adminPageDao.businessDelete(id);

	}

	@Override
	public void unlockUser(int deniedUserNo) {

		adminPageDao.unlockUser(deniedUserNo);

	}

	@Override
	public NormalUser normalUser(String id) {

		return adminPageDao.normalUser(id);
	}

	@Override
	public void reviewDelete(int reviewNo, String businessId) {
		adminPageDao.deleteOwnerComment(reviewNo, businessId);
		adminPageDao.reviewDelete(reviewNo);
	}
	
	@Override
	public Map<String, Object> adminNormalInquiryList(int pageNum) {
		
		int currentPage = pageNum;

		int startRow = (currentPage - 1) * PS;
		
		int listCount = 0;

		listCount = adminPageDao.getInquiryCount();

		if (listCount > 0) {

			List<UserInquiry> adminNormalInquiryList = adminPageDao.adminNormalInquiryList(startRow, PS);

			int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

			int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

			int endPage = startPage + PG - 1;

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("adminNormalInquiryList", adminNormalInquiryList);
			map.put("currentPage", currentPage);
			map.put("pageCount", pageCount);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("currentPage", currentPage);
			map.put("listCount", listCount);
			map.put("pageGroup", PG);

			return map;
		} else {
			return null;
		}
	}

	@Override
	public UserInquiry getInquiry(int userInquiryNo) {
		
		return adminPageDao.getInquiry(userInquiryNo);
	}

	@Override
	public void answerInquiry(UserInquiry userInquiry) {
		
		adminPageDao.answerInquiry(userInquiry);
		
	}

	@Override
	public Map<String, Object> adminBusinessInquiryList(int pageNum) {
		
		int currentPage = pageNum;

		int startRow = (currentPage - 1) * PS;
		
		int listCount = 0;

		listCount = adminPageDao.getBusinessInquiryCount();

		if (listCount > 0) {

			List<BusinessInquiry> adminBusinessInquiryList = adminPageDao.adminBusinessInquiryList(startRow, PS);

			int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

			int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

			int endPage = startPage + PG - 1;

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("adminBusinessInquiryList", adminBusinessInquiryList);
			map.put("currentPage", currentPage);
			map.put("pageCount", pageCount);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("currentPage", currentPage);
			map.put("listCount", listCount);
			map.put("pageGroup", PG);

			return map;
		} else {
			return null;
		}
	}

	@Override
	public BusinessInquiry getBusinessInquiry(int businessInquiryNo) {

		return adminPageDao.getBusinessInquiry(businessInquiryNo);
	}

	@Override
	public void answerBusinessInquiry(BusinessInquiry businessInquiry) {
		
		adminPageDao.answerBusinessInquiry(businessInquiry);
		
	}

}
