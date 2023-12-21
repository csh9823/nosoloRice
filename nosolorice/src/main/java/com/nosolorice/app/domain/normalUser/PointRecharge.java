package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

public class PointRecharge {
	private int pointRechargeNo;		// No
	private String normalId;				// 유저 아이디
	private String paymentMethod;		// 결제수단
	private int chargeAmount;			// 충전금액
	private int chargePoint;				// 충전포인트
	private Timestamp chargeDate;				// 충전일
	public PointRecharge() {
		
	}
	public int getPointRechargeNo() {
		return pointRechargeNo;
	}
	public void setPointRechargeNo(int pointRechargeNo) {
		this.pointRechargeNo = pointRechargeNo;
	}
	public String getNormalId() {
		return normalId;
	}
	public void setNormalId(String normalId) {
		this.normalId = normalId;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public int getChargeAmount() {
		return chargeAmount;
	}
	public void setChargeAmount(int chargeAmount) {
		this.chargeAmount = chargeAmount;
	}
	public int getChargePoint() {
		return chargePoint;
	}
	public void setChargePoint(int chargePoint) {
		this.chargePoint = chargePoint;
	}
	public Timestamp getChargeDate() {
		return chargeDate;
	}
	public void setChargeDate(Timestamp chargeDate) {
		this.chargeDate = chargeDate;
	}
	
	@Override
	public String toString() {
		return "PointRecharge [pointRechargeNo=" + pointRechargeNo + ", normalId=" + normalId + ", paymentMethod="
				+ paymentMethod + ", chargeAmount=" + chargeAmount + ", chargePoint=" + chargePoint + ", chargeDate="
				+ chargeDate + "]";
	}
	
	
	
}
