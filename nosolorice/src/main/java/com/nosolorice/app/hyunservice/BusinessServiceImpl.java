package com.nosolorice.app.hyunservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingOkMonth;
import com.nosolorice.app.domain.businessUser.BusinessInquiry;
import com.nosolorice.app.hyundao.BusinessDao;

@Service
public class BusinessServiceImpl implements BusinessService {

	private BusinessDao businessDao;
	@Autowired
	public BusinessServiceImpl(BusinessDao inquiryDao) {
		this.businessDao = inquiryDao;
	}
	@Override
	public void writeBusinessInquiry(BusinessInquiry businessInquiry) {
		businessDao.writeBusinessInquiry(businessInquiry);
	}

	@Override
	public Map<String, Object> getBusinessInquiryList(int pageNum, String businessId) {
		
		int pageSize = 10;
		int pageGroup = 10;
		int currentPage = pageNum;
		int start = (currentPage - 1) * pageSize;
		int listCount = businessDao.getBusinessInquiryListCount(businessId);
		
		if(listCount > 0) {
			List<BusinessInquiry> inquiryList = businessDao.getBusinessInquiryList(start, pageSize, businessId);

			int pageCount = listCount / pageSize + (listCount % pageSize == 0 ? 0 : 1);
			int startPage = (currentPage / pageGroup) * pageGroup + 1 - (currentPage % pageGroup == 0 ? pageGroup : 0);		
			int endPage = startPage + pageGroup - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> modelMap = new HashMap<String, Object>();		
			
			modelMap.put("inquiryList", inquiryList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", pageGroup);
			
			return modelMap;			
		} else return null;
		
	}
	
	
	
	@Override
	public Map<String, Object> getDailySalesList(int pageNum, String businessId) {
		
		int pageSize = 10;
		int pageGroup = 10;
		int currentPage = pageNum;
		int start = (currentPage - 1) * pageSize;
		int listCount = businessDao.getDailySalesListCount(businessId);
		
		if(listCount > 0) {
			List<BookingOk> salesList = businessDao.getDailySalesList(start, pageSize, businessId);

			int pageCount = listCount / pageSize + (listCount % pageSize == 0 ? 0 : 1);
			int startPage = (currentPage / pageGroup) * pageGroup + 1 - (currentPage % pageGroup == 0 ? pageGroup : 0);		
			int endPage = startPage + pageGroup - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> modelMap = new HashMap<String, Object>();		

			modelMap.put("salesList", salesList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", pageGroup);
			
			return modelMap;			
		} else return null;
		
	}
	@Override
	public Map<String, Object> getMonthlySalesList(int pageNum, String businessId) {
		
		int pageSize = 12;
		int pageGroup = 10;
		int currentPage = pageNum;
		int start = (currentPage - 1) * pageSize;
		int listCount = businessDao.getMonthlySalesListCount(businessId);
		
		if(listCount > 0) {
			List<BookingOkMonth> mSalesList = businessDao.getMonthlySalesList(start, pageSize, businessId);
			
			int pageCount = listCount / pageSize + (listCount % pageSize == 0 ? 0 : 1);
			int startPage = (currentPage / pageGroup) * pageGroup + 1 - (currentPage % pageGroup == 0 ? pageGroup : 0);		
			int endPage = startPage + pageGroup - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			modelMap.put("mSalesList", mSalesList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", pageGroup);
			
			return modelMap;			
		} else return null;
		
	}
}
