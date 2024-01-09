package com.nosolorice.app.jindao;

import com.nosolorice.app.domain.businessUser.Menu;

public interface JinMenuInterfaceDao {
	abstract public void MenuAdd(Menu menu);
	abstract public void Nofilemenuadd(Menu menu);
	abstract public void MenuDelete(int menuNo);
	abstract public String getMenu(int menuNo);
	abstract public Menu getMenuajax(int menuNo);
	abstract public void MenuUpdate(Menu menu);
}
