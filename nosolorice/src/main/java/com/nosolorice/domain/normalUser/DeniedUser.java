package com.nosolorice.domain.normalUser;

import java.sql.Timestamp;

public class DeniedUser {

	private int deniedUserNo;		// No
	private String normalId;			// 유저 아이디
	private String deniedReason;	// 정지사유
	private Timestamp deniedUnlock;		// 정지해제일
	
	
}
