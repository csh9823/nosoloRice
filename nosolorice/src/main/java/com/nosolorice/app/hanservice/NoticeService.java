package com.nosolorice.app.hanservice;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.businessUser.BusinessNotice;
import com.nosolorice.app.domain.normalUser.Notice;

public interface NoticeService {
	//공지사항 리스트
	public abstract Map<String,Object> NoticeList(int pageNum);
	//디테일
	public abstract Notice getNotice(int noticeNo);
	//추가
	public abstract void insertNotice(Notice notice);
	//수정
	public abstract void updateNotice(Notice notice);
	//삭제
	public abstract void deleteNotice(int noticeNo);
	
	public abstract Map<String,Object> BusinessNoticeList(int pageNum);
	
	public abstract BusinessNotice getBusinessnotice(int businessNoticeNo);
	
	public abstract void updateBusinessNotice(BusinessNotice businessNotice);
	
	public abstract void deleteBusinessNotice(int businessNoticeNo);

}
