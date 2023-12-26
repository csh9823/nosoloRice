package com.nosolorice.app.domain.businessUser;

//메뉴
public class Menu {
	
	private int menuNo;				// No
	private String menuName;		// 메뉴이름
	private int menuPrice;			// 메뉴가격
	private String menuInfo;			// 메뉴정보
	private String menuOrigin;		// 원산지
	private String menuPicture;		// 메뉴사진 파일
	private int menuCategoryNo;		// 카테고리 번호
	
	public Menu() {
		
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuInfo() {
		return menuInfo;
	}
	public void setMenuInfo(String menuInfo) {
		this.menuInfo = menuInfo;
	}
	public String getMenuOrigin() {
		return menuOrigin;
	}
	public void setMenuOrigin(String menuOrigin) {
		this.menuOrigin = menuOrigin;
	}
	public String getMenuPicture() {
		return menuPicture;
	}
	public void setMenuPicture(String menuPicture) {
		this.menuPicture = menuPicture;
	}
	public int getMenuCategoryNo() {
		return menuCategoryNo;
	}
	public void setMenuCategoryNo(int menuCategoryNo) {
		this.menuCategoryNo = menuCategoryNo;
	}
	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", menuInfo="
				+ menuInfo + ", menuOrigin=" + menuOrigin + ", menuPicture=" + menuPicture + ", menuCategoryNo="
				+ menuCategoryNo + "]";
	}
	
	
}
