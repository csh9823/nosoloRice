package com.nosolorice.app.jinservice;

import java.util.List;
import java.util.Map;

public interface JinReviewInterface {
	abstract public List<Map<String, Object>> ReviewList (String businessId);
}
