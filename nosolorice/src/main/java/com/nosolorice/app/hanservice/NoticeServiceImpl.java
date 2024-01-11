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
	
	private static final int PS = 10;
	
	private static final int PG = 10;
	
	
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
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("nList", nList);
		map.put("currentPage", currentPage);
		map.put("pageCount", pageCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("listCount", listCount);
		map.put("PG", PG);
		
		
		return map;
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
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("bList", bList);
		map.put("bcurrentPage", currentPage);
		map.put("bpageCount", pageCount);
		map.put("bstartPage", startPage);
		map.put("bendPage", endPage);
		map.put("blistCount", listCount);
		map.put("bPG", PG);
		
		
		return map;
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
