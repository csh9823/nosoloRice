package com.nosolorice.app.domain.businessUser;


public class BusinessSectors {
	//사업자 업종 ==> 테이블 설명필요
	
	private int businessSectorsNo;	// 사업자업종번호
	private int sectorsNo;				// 업종번호
	private String businessId;		// 사업자 아이디
	
	public BusinessSectors() {
		
	}
	public int getBusinessSectorsNo() {
		return businessSectorsNo;
	}
	public void setBusinessSectorsNo(int businessSectorsNo) {
		this.businessSectorsNo = businessSectorsNo;
	}
	public int getSectorsNo() {
		return sectorsNo;
	}
	public void setSectorsNo(int sectorsNo) {
		this.sectorsNo = sectorsNo;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	@Override
	public String toString() {
		return "BusinessSectors [businessSectorsNo=" + businessSectorsNo + ", sectorsNo=" + sectorsNo + ", businessId="
				+ businessId + "]";
	}

}
