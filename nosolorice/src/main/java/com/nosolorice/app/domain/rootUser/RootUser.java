package com.nosolorice.app.domain.rootUser;

public class RootUser {
	int rootNo;  
    String rootName;
    String rootId;
    String rootPass;
    int root;
    
	public RootUser() {
		
	}

	public int getRootNo() {
		return rootNo;
	}

	public void setRootNo(int rootNo) {
		this.rootNo = rootNo;
	}

	public String getRootName() {
		return rootName;
	}

	public void setRootName(String rootName) {
		this.rootName = rootName;
	}

	public String getRootId() {
		return rootId;
	}

	public void setRootId(String rootId) {
		this.rootId = rootId;
	}

	public String getRootPass() {
		return rootPass;
	}

	public void setRootPass(String rootPass) {
		this.rootPass = rootPass;
	}

	public int getRoot() {
		return root;
	}

	public void setRoot(int root) {
		this.root = root;
	}

	@Override
	public String toString() {
		return "RootUser [rootNo=" + rootNo + ", rootName=" + rootName + ", rootId=" + rootId + ", rootPass=" + rootPass
				+ ", root=" + root + "]";
	}
    
    
}
