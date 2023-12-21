package com.nosolorice.app.domain.normalUser;

public class ReportDetails {
	private int reportNo;				// No
	private String reportContent;	// 신고내용
	private String reportPicture;		// 증거사진 파일
	private String reportReporter;	// 신고자
	private String reportAttacker;	// 신고당한사람
	private String ReportRegdate; // 신고일
	
	
	public ReportDetails() {
		
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


	public String getReportRegdate() {
		return ReportRegdate;
	}


	public void setReportRegdate(String reportRegdate) {
		ReportRegdate = reportRegdate;
	}


	@Override
	public String toString() {
		return "ReportDetails [reportNo=" + reportNo + ", reportContent=" + reportContent + ", reportPicture="
				+ reportPicture + ", reportReporter=" + reportReporter + ", reportAttacker=" + reportAttacker
				+ ", ReportRegdate=" + ReportRegdate + "]";
	}
	
	
	
}
