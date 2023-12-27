package com.nosolorice.app.handao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.businessUser.BusinessNotice;
import com.nosolorice.app.domain.normalUser.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	private static final String Mapper = "com.nosolorice.app.mapper.NoticeMapper";

	
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	public NoticeDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Notice> NoticeList() {
		
		return  sqlSession.selectList(Mapper + ".noticeList");
	}

	@Override
	public Notice getNotice(int noticeNo) { 
		
		return sqlSession.selectOne(Mapper + ".noticeDetail",noticeNo);
	
	}

	@Override
	public void insertNotice(Notice notice) {
		
		sqlSession.insert(Mapper + ".noticeWrite",notice);
		
	}

	@Override
	public void updateNotice(Notice notice) {
		
		sqlSession.update(Mapper + ".noticeUpdate",notice);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		
		sqlSession.delete(Mapper + ".noticeDelete",noticeNo);
	
		
		
	}

	@Override
	public List<BusinessNotice> BusinessNoticeList() {
		
		return  sqlSession.selectList(Mapper + ".noticeBusiness");
	}



}
