package com.nosolorice.app.hanservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.handao.NoticeDao;
import com.nosolorice.app.domain.businessUser.BusinessNotice;
import com.nosolorice.app.domain.normalUser.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDao noticeDao;
	
	private static final int PS = 5;
	
	private static final int PG = 5;
	
	
	@Autowired
	public NoticeServiceImpl(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public Map<String,Object> NoticeList(int pageNum) {
		
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PS;
		
		int listCount = 0;
		
		listCount = noticeDao.getNoticeCount();
		
		if(listCount > 0) {
		
		List<Notice> nList = noticeDao.NoticeList(start, PS);
		
		int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);
	
		int startPage = (currentPage / PG ) * PG + 1 
				- (currentPage % PG == 0 ? PG : 0);
		
		int endPage = startPage + PG - 1;
		
		if(endPage > pageCount) {
			
			endPage = pageCount;
		}
		
		Map<String,Object> noticeMap = new HashMap<String,Object>();
		
		noticeMap.put("nList", nList);
		noticeMap.put("currentPage", currentPage);
		noticeMap.put("pageCount", pageCount);
		noticeMap.put("startPage", startPage);
		noticeMap.put("endPage", endPage);
		noticeMap.put("listCount", listCount);
		noticeMap.put("PG", PG);
		
		
		return noticeMap;
		} else {
		return null;
		}
	}

	@Override
	public Notice getNotice(int noticeNo) {
		
		return noticeDao.getNotice(noticeNo);
	}

	@Override
	public void insertNotice(Notice notice) {
		
		noticeDao.insertNotice(notice);
		
	}

	@Override
	public void updateNotice(Notice notice) {
		
		noticeDao.updateNotice(notice);
		
	}

	@Override
	public void deleteNotice(int noticeNo) {
		
		noticeDao.deleteNotice(noticeNo);
		
	}

	@Override
	public Map<String,Object> BusinessNoticeList(int pageNum) {
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PS;
		
		int listCount = 0;
		
		listCount = noticeDao.getBusinessNoticeCount();
		
		if(listCount > 0) {
		
		List<BusinessNotice> bList = noticeDao.BusinessNoticeList(start, PS);
		
		int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);
	
		int startPage = (currentPage / PG ) * PG + 1 
				- (currentPage % PG == 0 ? PG : 0);
		
		int endPage = startPage + PG - 1;
		
		if(endPage > pageCount) {
			
			endPage = pageCount;
		}
		
		Map<String,Object> businessNoticeMap = new HashMap<String,Object>();
		
		businessNoticeMap.put("bList", bList);
		businessNoticeMap.put("bcurrentPage", currentPage);
		businessNoticeMap.put("bpageCount", pageCount);
		businessNoticeMap.put("bstartPage", startPage);
		businessNoticeMap.put("bendPage", endPage);
		businessNoticeMap.put("blistCount", listCount);
		businessNoticeMap.put("bPG", PG);
		
		
		return businessNoticeMap;
		} else {
		return null;
		}
		
	}

	@Override
	public BusinessNotice getBusinessnotice(int businessNoticeNo) {
		
		return noticeDao.getBusinessnotice(businessNoticeNo);
	}

	@Override
	public void updateBusinessNotice(BusinessNotice businessNotice) {
		
		noticeDao.updateBusinessNotice(businessNotice);
		
	}

	@Override
	public void deleteBusinessNotice(int businessNoticeNo) {

		noticeDao.deleteBusinessNotice(businessNoticeNo);
		
	}

}
