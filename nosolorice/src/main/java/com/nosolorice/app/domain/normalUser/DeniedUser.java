package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

public class DeniedUser {

	private int deniedUserNo;		// No
	private String normalId;			// 유저 아이디
	private String deniedReason;	// 정지사유
	private Timestamp deniedUnlock;		// 정지해제일
	private Timestamp DeniedRegdate;
	public DeniedUser() {
	
	}

	public int getDeniedUserNo() {
		return deniedUserNo;
	}

	public void setDeniedUserNo(int deniedUserNo) {
		this.deniedUserNo = deniedUserNo;
	}

	public String getNormalId() {
		return normalId;
	}

	public void setNormalId(String normalId) {
		this.normalId = normalId;
	}

	public String getDeniedReason() {
		return deniedReason;
	}

	public void setDeniedReason(String deniedReason) {
		this.deniedReason = deniedReason;
	}

	public Timestamp getDeniedUnlock() {
		return deniedUnlock;
	}

	public void setDeniedUnlock(Timestamp deniedUnlock) {
		this.deniedUnlock = deniedUnlock;
	}

	@Override
	public String toString() {
		return "DeniedUser [deniedUserNo=" + deniedUserNo + ", normalId=" + normalId + ", deniedReason=" + deniedReason
				+ ", deniedUnlock=" + deniedUnlock + "]";
	}
	
	
}
