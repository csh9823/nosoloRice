package com.nosolorice.app.jinservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nosolorice.app.domain.businessUser.Menu;
import com.nosolorice.app.jindao.JinMenuDaoImpl;

@Service
public class JinMenuService implements JinMenuInterface {
	
	@Autowired
	JinMenuDaoImpl jinMenuDaoImpl;
	
	@Override
	public void MenuAdd(Menu menu) {
		jinMenuDaoImpl.MenuAdd(menu);
	}

	@Override
	public void Nofilemenuadd(Menu menu) {
		jinMenuDaoImpl.Nofilemenuadd(menu);
	}
	
	public void MenuDelete(int menuNo) {
		jinMenuDaoImpl.MenuDelete(menuNo);
	}
	public String getMenu(int menuNo) {
		return jinMenuDaoImpl.getMenu(menuNo);
	}
	
	public Menu getMenuajax(int menuNo) {
		
		return jinMenuDaoImpl.getMenuajax(menuNo);
		
	}
	
	public void MenuUpdate(Menu menu) {
		
		jinMenuDaoImpl.MenuUpdate(menu);
		
	}
}
