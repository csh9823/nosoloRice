package com.nosolorice.app.domain.businessUser;

//업종 카테고리
public class Sectors {
	
	private int sectorsNo;			// No
	private String sectorName;	// 업종명

	public Sectors() {
		
	}
	public int getSectorsNo() {
		return sectorsNo;
	}
	public void setSectorsNo(int sectorsNo) {
		this.sectorsNo = sectorsNo;
	}
	public String getSectorName() {
		return sectorName;
	}
	public void setSectorName(String sectorName) {
		this.sectorName = sectorName;
	}
	@Override
	public String toString() {
		return "Sectors [sectorsNo=" + sectorsNo + ", sectorName=" + sectorName + "]";
	}	
	
}
