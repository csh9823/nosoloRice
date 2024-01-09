package com.nosolorice.app.jindao;

import java.util.List;
import java.util.Map;

public interface JinReviewInterfacDao {
	abstract public List<Map<String, Object>> ReviewList (String businessId);
}
