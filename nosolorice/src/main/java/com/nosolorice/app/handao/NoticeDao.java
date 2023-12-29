package com.nosolorice.app.handao;


import java.util.List;

import com.nosolorice.app.domain.businessUser.BusinessNotice;
import com.nosolorice.app.domain.normalUser.Notice;

public interface NoticeDao {
	//공지사항
	public abstract List <Notice> NoticeList();
	//디테일
	public abstract Notice getNotice(int noticeNo);
	//추가
	public abstract void insertNotice(Notice notice);
	//수정
	public abstract void updateNotice(Notice notice);
	//삭제
	public abstract void deleteNotice(int noticeNo);
	
	public abstract List<BusinessNotice> BusinessNoticeList();
	
	public abstract BusinessNotice getBusinessnotice(int businessNoticeNo);
	
	public abstract void updateBusinessNotice(BusinessNotice businessNotice);
	
	public abstract void deleteBusinessNotice(int businessNoticeNo);
	
}
