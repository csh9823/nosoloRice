package com.nosolorice.app.domain.normalUser;

public class ReportDetails {
	private int reportNo;				// No
	private String reportContent;	// 신고내용
	private String reportPicture;		// 증거사진 파일
	private String reportReporter;	// 신고자
	private String reportAttacker;	// 신고당한사람
	
	public ReportDetails() {};
	public ReportDetails(int reportNo, String reportContent, String reportPicture, String reportReporter,
			String reportAttacker) {
		this.reportNo = reportNo;
		this.reportContent = reportContent;
		this.reportPicture = reportPicture;
		this.reportReporter = reportReporter;
		this.reportAttacker = reportAttacker;
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
	};
	
	
	
	
	
	
}
