package com.nosolorice.app.domain.normalUser;

public class MatchingOption {
	private String normalId;					// 유저아이디
	private int matchingCount;				// 인원
	private String matchingXpoint;			// 위도
	private String matchingYpoint;			// 경도
	private String matchingAddress1;		// 주소
	private String matchingDivision;		// 위치 선택옵션 (지도/주소)
	private String matchingCateOption1;	// 카테고리 옵션1
	private String matchingCateOption2;	// 카테고리 옵션2
	private String matchingCateOption3;	// 카테고리 옵션3
	private String matchingGender;			// 성별체크
	private String matchingAge;				// 연령체크
	public String getNormalId() {
		return normalId;
	}
	public void setNormalId(String normalId) {
		this.normalId = normalId;
	}
	public int getMatchingCount() {
		return matchingCount;
	}
	public void setMatchingCount(int matchingCount) {
		this.matchingCount = matchingCount;
	}
	public String getMatchingXpoint() {
		return matchingXpoint;
	}
	public void setMatchingXpoint(String matchingXpoint) {
		this.matchingXpoint = matchingXpoint;
	}
	public String getMatchingYpoint() {
		return matchingYpoint;
	}
	public void setMatchingYpoint(String matchingYpoint) {
		this.matchingYpoint = matchingYpoint;
	}
	public String getMatchingAddress1() {
		return matchingAddress1;
	}
	public void setMatchingAddress1(String matchingAddress1) {
		this.matchingAddress1 = matchingAddress1;
	}
	public String getMatchingDivision() {
		return matchingDivision;
	}
	public void setMatchingDivision(String matchingDivision) {
		this.matchingDivision = matchingDivision;
	}
	public String getMatchingCateOption1() {
		return matchingCateOption1;
	}
	public void setMatchingCateOption1(String matchingCateOption1) {
		this.matchingCateOption1 = matchingCateOption1;
	}
	public String getMatchingCateOption2() {
		return matchingCateOption2;
	}
	public void setMatchingCateOption2(String matchingCateOption2) {
		this.matchingCateOption2 = matchingCateOption2;
	}
	public String getMatchingCateOption3() {
		return matchingCateOption3;
	}
	public void setMatchingCateOption3(String matchingCateOption3) {
		this.matchingCateOption3 = matchingCateOption3;
	}
	public String getMatchingGender() {
		return matchingGender;
	}
	public void setMatchingGender(String matchingGender) {
		this.matchingGender = matchingGender;
	}
	public String getMatchingAge() {
		return matchingAge;
	}
	public void setMatchingAge(String matchingAge) {
		this.matchingAge = matchingAge;
	}


}
