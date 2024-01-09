package com.nosolorice.app.jindao;

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

}
