package com.nosolorice.app.handao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Notice> NoticeList(int start, int num) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("num", num);
		
		
		return  sqlSession.selectList(Mapper + ".noticeList",params);
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
	public List<BusinessNotice> BusinessNoticeList(int start,int num) {
		
Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("num", num);
		
		return  sqlSession.selectList(Mapper + ".BusinessNotice",params);
	}

	@Override
	public BusinessNotice getBusinessnotice(int businessNoticeNo) {
		
		return sqlSession.selectOne(Mapper +".BusinessNoticeDetail",businessNoticeNo);
	}

	@Override
	public void updateBusinessNotice(BusinessNotice businessNotice) {
		
		sqlSession.update(Mapper + ".updateNoticeBusiness",businessNotice);
		
	}

	@Override
	public void deleteBusinessNotice(int businessNoticeNo) {

		sqlSession.delete(Mapper + ".deleteBusinessNotice",businessNoticeNo);
		
	}

	@Override
	public int getNoticeCount() {
		return sqlSession.selectOne(Mapper + ".getNoticeCount");
		
	}

	@Override
	public int getBusinessNoticeCount() {
		
		return sqlSession.selectOne(Mapper + ".getBusinessNoticeCount");
		
		
	}


}
