package com.nosolorice.app.domain.businessUser;

//가입 승인 리스트
public class JoinApprove {
	
	private int joinApproveNo;	// No
	private String businessId;	// 사업자 아이디
	public int getJoinApproveNo() {
		return joinApproveNo;
	}
	public void setJoinApproveNo(int joinApproveNo) {
		this.joinApproveNo = joinApproveNo;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	
	
}
