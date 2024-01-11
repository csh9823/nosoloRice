package com.nosolorice.app.jindao;

import java.util.List;
import java.util.Map;

public interface JinReviewInterfacDao {
	abstract public List<Map<String, Object>> ReviewList (String businessId);
	abstract public void Businessriviewblind(int revireNo);
	abstract public void Businessriviewdelete(int revireNo);
	abstract public void Businessreviewadd(int reviewNo, String normalId, String businessId, String businessComment);
	abstract public void OwnerCommentupdate(String businessComment2, int reviewNo);
	abstract public void OwnerCommentdelete(int reviewNo);
	abstract public String getreviewcoung(String businessId);
}
