package com.nosolorice.app.jinservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.businessUser.MenuCategory;
import com.nosolorice.app.jindao.JinMenuCateDaoImpl;

@Service
public class JinMenuCateService implements JinMenuCateInterface {
	
	
	@Autowired
	private  JinMenuCateDaoImpl jinMenuCateDaoImpl;
	
	@Override
	public void MenuCateadd(String businessId,String menuCateName) {
		jinMenuCateDaoImpl.MenuCateadd(businessId,menuCateName);
	}

	@Override
	public void MenuCateDelete(String businessId,int menuCategoryNo) {
		
		jinMenuCateDaoImpl.MenuCateDelete(businessId, menuCategoryNo);

	}
	
	// 카테고리 리스트 가져오기
	public List<MenuCategory> MenuCateList(String businessId){
		
		return jinMenuCateDaoImpl.MenuCateList(businessId);
	}


	public List<Map<String, Object>> NoMenuList(String menuCategoryNo){
		
		return jinMenuCateDaoImpl.NoMenuList(menuCategoryNo);
	}
	
	public List<Map<String, Object>> AllMenuList(String businessId){
		
		return jinMenuCateDaoImpl.AllMenuList(businessId);
	}
	public String MenuCateName(int menuCategoryNo) {
		
		 return jinMenuCateDaoImpl.MenuCateName(menuCategoryNo);
		 
	}
}
