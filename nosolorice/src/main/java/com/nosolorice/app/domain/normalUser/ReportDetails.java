package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

public class ReportDetails {
	private int reportNo;				// No
	private String reportContent;	// 신고내용
	private String reportPicture;		// 증거사진 파일
	private String reportReporter;	// 신고자
	private String reportAttacker;	// 신고당한사람
	private Timestamp reportRegDate; // 신고일
	//한선 추가 
	private Timestamp deniedUnlock; //해제일
	private Timestamp deniedRegDate;

	
	public ReportDetails() {
		
	}



	public ReportDetails(int reportNo, String reportContent, String reportPicture, String reportReporter,
			String reportAttacker, Timestamp reportRegDate,Timestamp deniedUnlock,Timestamp deniedRegDate) {
		this.reportNo = reportNo;
		this.reportContent = reportContent;
		this.reportPicture = reportPicture;
		this.reportReporter = reportReporter;
		this.reportAttacker = reportAttacker;
		this.reportRegDate = reportRegDate;
		this.deniedUnlock = deniedUnlock;
		this.deniedRegDate = deniedRegDate;
	}



	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportPicture() {
		return reportPicture;
	}

	public void setReportPicture(String reportPicture) {
		this.reportPicture = reportPicture;
	}

	public String getReportReporter() {
		return reportReporter;
	}

	public void setReportReporter(String reportReporter) {
		this.reportReporter = reportReporter;
	}

	public String getReportAttacker() {
		return reportAttacker;
	}

	public void setReportAttacker(String reportAttacker) {
		this.reportAttacker = reportAttacker;
	}

	
	public Timestamp getReportRegDate() {
		return reportRegDate;
		}

	public void setReportRegDate(Timestamp reportRegDate) {
		this.reportRegDate = reportRegDate;

	}
	
	public Timestamp getDeniedUnlock() {
		return deniedUnlock;
	}



	public void setDeniedUnlock(Timestamp deniedUnlock) {
		this.deniedUnlock = deniedUnlock;
	}



	public Timestamp getDeniedRegDate() {
		return deniedRegDate;
	}



	public void setDeniedRegDate(Timestamp deniedRegDate) {
		this.deniedRegDate = deniedRegDate;
	}



	@Override
	public String toString() {
		return "ReportDetails [reportNo=" + reportNo + ", reportContent=" + reportContent + ", reportPicture="
				+ reportPicture + ", reportReporter=" + reportReporter + ", reportAttacker=" + reportAttacker

				+ ", ReportRegdate=" + reportRegDate + "]";
	}	

public String resultDate() {
		
		long millisecondsDiff = this.deniedUnlock.getTime() - this.deniedRegDate.getTime();
		
		long daysDiff = millisecondsDiff / (24 * 60 * 60 * 1000);
		
		if(daysDiff > 100) {
			
			return "영구 정지";
		} 
		return daysDiff + "일 정지" ;
	}
	
}
