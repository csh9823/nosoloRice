package com.nosolorice.app.jindao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.businessUser.MenuCategory;

@Repository
public class JinMenuCateDaoImpl implements JinMenuCateInterfaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mapper.MenuCateMapper";
	
	@Override
	public void MenuCateadd(String businessId,String menuCateName) {

		HashMap<String, String> map = new HashMap<>();
		map.put("businessId", businessId);
		map.put("menuCateName", menuCateName);
		sqlSession.insert(NAME_SPACE+".MenuCateadd", map);
	}

	@Override
	public void MenuCateDelete(String businessId,int menuCategoryNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("businessId", businessId);
		map.put("menuCategoryNo", menuCategoryNo);
		sqlSession.delete(NAME_SPACE+".MenuCateDelete", map);
	}
	
	
	// 전체 리스트
	public List<MenuCategory> MenuCateList(String businessId){
		return sqlSession.selectList(NAME_SPACE+".MenuCateList", businessId);
	}
	
	// 카테고리에 해당하는 메뉴 리스트
	public List<Map<String, Object>> NoMenuList(String menuCategoryNo){
		
		int intmenuCategoryNo = Integer.parseInt(menuCategoryNo);
		
		return sqlSession.selectList(NAME_SPACE+".NoMenuList", intmenuCategoryNo);
	}
	
	// 모든 아이디가 **인 모든 메뉴 가져오기
	public List<Map<String, Object>> AllMenuList(String businessId){
		return sqlSession.selectList(NAME_SPACE+".AllMenuList", businessId);
	}
	
	// 카테고리 이름 가져오기
	public String MenuCateName(int menuCategoryNo) {
		return sqlSession.selectOne(NAME_SPACE+".MenuCateName", menuCategoryNo);	}
}
