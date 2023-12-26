package com.nosolorice.app.domain.businessUser;

//메뉴 카테고리
public class MenuCategory {
	
	private int menuCategoryNo;				// No
	private String businessId;			// 사업자 아이디
	private String menuCategoryName;		// 메뉴 카테고리 이름

	public MenuCategory() {
	
	}

	public int getMenuCategoryNo() {
		return menuCategoryNo;
	}

	public void setMenuCategoryNo(int menuCategoryNo) {
		this.menuCategoryNo = menuCategoryNo;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getMenuCategoryName() {
		return menuCategoryName;
	}

	public void setMenuCategoryName(String menuCategoryName) {
		this.menuCategoryName = menuCategoryName;
	}

	@Override
	public String toString() {
		return "MenuCategory [menuCategoryNo=" + menuCategoryNo + ", businessId=" + businessId + ", menuCategoryName="
				+ menuCategoryName + ", getMenuCategoryNo()=" + getMenuCategoryNo() + ", getBusinessId()="
				+ getBusinessId() + ", getMenuCategoryName()=" + getMenuCategoryName() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
