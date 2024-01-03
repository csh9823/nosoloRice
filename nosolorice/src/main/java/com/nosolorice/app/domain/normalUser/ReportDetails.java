package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

public class ReportDetails {
	private int reportNo;				// No
	private String reportContent;	// 신고내용
	private String reportPicture;		// 증거사진 파일
	private String reportReporter;	// 신고자
	private String reportAttacker;	// 신고당한사람
	private Timestamp  reportRegdate; // 신고일
	
	public ReportDetails() {
		
	}



	public ReportDetails(int reportNo, String reportContent, String reportPicture, String reportReporter,
			String reportAttacker, Timestamp reportRegdate) {
		this.reportNo = reportNo;
		this.reportContent = reportContent;
		this.reportPicture = reportPicture;
		this.reportReporter = reportReporter;
		this.reportAttacker = reportAttacker;
		this.reportRegdate = reportRegdate;
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



	public Timestamp getReportRegdate() {
		return reportRegdate;
	}



	public void setReportRegdate(Timestamp reportRegdate) {
		this.reportRegdate = reportRegdate;
	}



	@Override
	public String toString() {
		return "ReportDetails [reportNo=" + reportNo + ", reportContent=" + reportContent + ", reportPicture="
				+ reportPicture + ", reportReporter=" + reportReporter + ", reportAttacker=" + reportAttacker
				+ ", ReportRegdate=" + reportRegdate + "]";
	}
	
	
	
}
