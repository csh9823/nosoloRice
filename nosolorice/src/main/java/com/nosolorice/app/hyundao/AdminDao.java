package com.nosolorice.app.hyundao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.booking.BookingOk;
import com.nosolorice.app.domain.booking.BookingOkMonth;
import com.nosolorice.app.domain.businessUser.JoinApprove;

@Repository
public interface AdminDao {
	public abstract List<JoinApprove> getJoinApproveList(int start, int pageSize);
	public abstract int getJoinApproveListCount();
	public abstract void updateJoinApprove(int businessNumber);
	public abstract void deleteJoinApprove(int no);
	
	public abstract List<BookingOk> getDailySalesList(int start, int pageSize);
	public abstract List<BookingOkMonth> getMonthlySalesList(int start, int pageSize);
	public abstract int getDailySalesListCount();
	public abstract int getMonthlySalesListCount();
}
