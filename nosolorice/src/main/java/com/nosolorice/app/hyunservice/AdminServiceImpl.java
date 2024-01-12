package com.nosolorice.app.hyunservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingOkMonth;
import com.nosolorice.app.domain.businessUser.JoinApprove;
import com.nosolorice.app.hyundao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminDao adminDao;
	@Autowired
	public AdminServiceImpl(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	@Override
	public Map<String, Object> getJoinApproveList(int pageNum) {
		
		int pageSize = 10;
		int pageGroup = 10;
		int currentPage = pageNum;
		int start = (currentPage - 1) * pageSize;
		int listCount = adminDao.getJoinApproveListCount();
		
		if(listCount > 0) {
			List<JoinApprove> jList = adminDao.getJoinApproveList(start, pageSize);

			int pageCount = listCount / pageSize + (listCount % pageSize == 0 ? 0 : 1);
			int startPage = (currentPage / pageGroup) * pageGroup + 1 - (currentPage % pageGroup == 0 ? pageGroup : 0);		
			int endPage = startPage + pageGroup - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			Map<String, Object> modelMap = new HashMap<String, Object>();		
			
			modelMap.put("jList", jList);
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
	public void updateJoinApprove(long businessNumber) {
		System.out.println("ajax서비스까지는 도착");
		adminDao.updateJoinApprove(businessNumber);
	}

	@Override
	public void deleteJoinApprove(int no) {
		adminDao.deleteJoinApprove(no);
	}

	@Override
	public Map<String, Object> getDailySalesList(int pageNum) {
		
		int pageSize = 10;
		int pageGroup = 10;
		int currentPage = pageNum;
		int start = (currentPage - 1) * pageSize;
		int listCount = adminDao.getDailySalesListCount();
		
		if(listCount > 0) {
			List<BookingOk> salesList = adminDao.getDailySalesList(start, pageSize);

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
	public Map<String, Object> getMonthlySalesList(int pageNum) {
		
		int pageSize = 12;
		int pageGroup = 10;
		int currentPage = pageNum;
		int start = (currentPage - 1) * pageSize;
		int listCount = adminDao.getMonthlySalesListCount();
		
		if(listCount > 0) {
			List<BookingOkMonth> mSalesList = adminDao.getMonthlySalesList(start, pageSize);
			
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
