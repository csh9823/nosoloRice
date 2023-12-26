package com.nosolorice.app.handao;


import java.util.List;

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
	
}
