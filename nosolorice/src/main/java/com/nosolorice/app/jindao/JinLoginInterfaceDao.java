package com.nosolorice.app.jindao;

import com.nosolorice.app.domain.businessUser.BusinessUser;
import com.nosolorice.app.domain.normalUser.NormalUser;
import com.nosolorice.app.domain.rootUser.RootUser;

public interface JinLoginInterfaceDao {
	abstract public BusinessUser loginBusinessUser(String id, String pass);
	abstract public NormalUser loginNormalUser(String id, String pass);
	abstract public RootUser loginRootUser(String id, String pass);
}
