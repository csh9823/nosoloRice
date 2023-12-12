package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

public class PointHistory {
	private int pointHistoryNo;	// No
	private Timestamp historyDate;		// 포인트 사용날짜
	private int historyPoint;		// 사용포인트
	private String businessId;	// 포인트 사용매장 => 사장님 아이디로 하는건??
	private String normalId;		// 유저아이디
	
	
}
