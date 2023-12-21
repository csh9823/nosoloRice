package com.nosolorice.app.domain.normalUser;

import java.sql.Date;

public class BlockHistory {
	private int blockHistoryNo;
	private Date blockDate;
	private String blockState;
	private String blocker;
	private String blockAttacker;
	
	public BlockHistory() {
	
	}

	public int getBlockHistoryNo() {
		return blockHistoryNo;
	}

	public void setBlockHistoryNo(int blockHistoryNo) {
		this.blockHistoryNo = blockHistoryNo;
	}

	public Date getBlockDate() {
		return blockDate;
	}

	public void setBlockDate(Date blockDate) {
		this.blockDate = blockDate;
	}

	public String getBlockState() {
		return blockState;
	}

	public void setBlockState(String blockState) {
		this.blockState = blockState;
	}

	public String getBlocker() {
		return blocker;
	}

	public void setBlocker(String blocker) {
		this.blocker = blocker;
	}

	public String getBlockAttacker() {
		return blockAttacker;
	}

	public void setBlockAttacker(String blockAttacker) {
		this.blockAttacker = blockAttacker;
	}

	@Override
	public String toString() {
		return "BlockHistory [blockHistoryNo=" + blockHistoryNo + ", blockDate=" + blockDate + ", blockState="
				+ blockState + ", blocker=" + blocker + ", blockAttacker=" + blockAttacker + "]";
	}
	
	
}
