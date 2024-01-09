package com.nosolorice.app.jindao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JinReviewDaoImpl implements JinReviewInterfacDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mapper.JinReviewMapper";
	
	@Override
	public List<Map<String, Object>> ReviewList(String businessId) {
		
		return sqlSession.selectList(NAME_SPACE + ".ReviewList", businessId);
	}
	
	public void Businessriviewblind(int revireNo) {
		sqlSession.update(NAME_SPACE + ".Businessriviewblind",revireNo);
	}
	
	public void Businessriviewdelete(int revireNo) {
		sqlSession.update(NAME_SPACE + ".Businessriviewdelete",revireNo);
	}
	
	public void Businessreviewadd(int reviewNo, String normalId, String businessId, String businessComment) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("normalId", normalId);
		map.put("businessId", businessId);
		map.put("businessComment", businessComment);
		sqlSession.insert(NAME_SPACE + ".Businessreviewadd", map);
	}
	
	public void OwnerCommentupdate(String businessComment2, int reviewNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("businessComment2", businessComment2);
		sqlSession.update(NAME_SPACE + ".OwnerCommentupdate", map);
	}
	
	public void OwnerCommentdelete(int reviewNo) {
		sqlSession.delete(NAME_SPACE + ".OwnerCommentdelete",reviewNo);
	}
}
