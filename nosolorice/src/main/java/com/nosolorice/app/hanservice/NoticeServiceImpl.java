package com.nosolorice.app.hanservice;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.handao.NoticeDao;
import com.nosolorice.app.domain.businessUser.BusinessNotice;
import com.nosolorice.app.domain.normalUser.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDao noticeDao;
	
	
	@Autowired
	public NoticeServiceImpl(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public List<Notice> NoticeList() {
		
		return noticeDao.NoticeList();
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
	public List<BusinessNotice> BusinessNoticeList() {
		return noticeDao.BusinessNoticeList();
		
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
