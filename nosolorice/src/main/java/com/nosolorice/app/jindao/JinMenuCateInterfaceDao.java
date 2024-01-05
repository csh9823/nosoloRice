package com.nosolorice.app.jindao;

import java.util.List;
import java.util.Map;

import com.nosolorice.app.domain.businessUser.MenuCategory;

public interface JinMenuCateInterfaceDao {
	abstract public void MenuCateadd(String businessId,String menuCateName);
	abstract public void MenuCateDelete(String businessId,int menuCategoryNo);
	abstract public List<MenuCategory> MenuCateList(String businessId);
	abstract public List<Map<String, Object>> NoMenuList(String menuCategoryNo);
	abstract public List<Map<String, Object>> AllMenuList(String businessId);
	abstract public String MenuCateName(int menuCategoryNo);
}
