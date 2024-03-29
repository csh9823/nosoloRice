package com.nosolorice.app.jindao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.businessUser.Menu;

@Repository
public class JinMenuDaoImpl implements JinMenuInterfaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mapper.MenuMapper";
	
	
	@Override
	public void MenuAdd(Menu menu) {
		sqlSession.insert(NAME_SPACE + ".Menuadds",menu);
	}

	@Override
	public void Nofilemenuadd(Menu menu) {
		sqlSession.insert(NAME_SPACE + ".Menuadds",menu);
	}
	
	public void MenuDelete(int menuNo) {
		sqlSession.delete(NAME_SPACE + ".MenuDelete",menuNo);
	}
	
	public String getMenu(int menuNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getMenu", menuNo);
	}
	
	public Menu getMenuajax(int menuNo) {
		return sqlSession.selectOne(NAME_SPACE + ".getMenuajax", menuNo);
	}
	
	public void MenuUpdate(Menu menu) {
		System.out.println("다오 왓음" + menu.getMenuPicture());
		
		if(menu.getMenuPicture() == null) {
			sqlSession.update(NAME_SPACE+".nofileMenuUpdate",menu);
		}else{
			sqlSession.update(NAME_SPACE+".MenuUpdate",menu);
			}
		
	}
}
