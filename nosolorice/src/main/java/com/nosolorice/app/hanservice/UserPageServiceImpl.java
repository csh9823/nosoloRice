package com.nosolorice.app.hanservice;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nosolorice.app.handao.UserPageDao;
import com.nosolorice.app.domain.normalUser.BlockHistory;
import com.nosolorice.app.domain.normalUser.ReportDetails;
@Service
public class UserPageServiceImpl implements UserPageService {

	private UserPageDao userPageDao;
	
	private static final int PS = 10;

	private static final int PG = 10;

	@Autowired
	public UserPageServiceImpl(UserPageDao userPageDao) {
		
		this.userPageDao = userPageDao;
	}

	@Override
	public Map<String, Object> userReportList(String reporter,int pageNum) {
		
		int currentPage = pageNum;

		int start = (currentPage - 1) * PS;

		int listCount = 0;

		listCount = userPageDao.getUserReportCount();

		if (listCount > 0) {

			List<ReportDetails> userReportList = userPageDao.userReportList(reporter,start, PS);

			int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

			int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

			int endPage = startPage + PG - 1;

			if (endPage > pageCount) {

				endPage = pageCount;
			}

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("userReportList", userReportList);
			map.put("currentPage", currentPage);
			map.put("pageCount", pageCount);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("listCount", listCount);
			map.put("PG", PG);

			return map;
		} else {
			return null;
		}
	}

	@Override
	public Map<String, Object> blockList(String blocker,int pageNum) {
		
		
		int currentPage = pageNum;

		int start = (currentPage - 1) * PS;

		int listCount = 0;	

		listCount = userPageDao.getBlockCount();
		
		System.out.println("리스트 카운트 : " + listCount);
		
		

		if (listCount >= 0) {

			List<BlockHistory> blockList = userPageDao.blockList(blocker, start, PS);
				
			for(BlockHistory b : blockList) {
				System.out.println("블록 리스트" + b);
			}
		

			int pageCount = listCount / PS + (listCount % PS == 0 ? 0 : 1);

			int startPage = (currentPage / PG) * PG + 1 - (currentPage % PG == 0 ? PG : 0);

			int endPage = startPage + PG - 1;

			if (endPage > pageCount) {

				endPage = pageCount;
			}

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("blockList", blockList);
			map.put("currentPage", currentPage);
			map.put("pageCount", pageCount);
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("listCount", listCount);
			map.put("PG", PG);

			return map;
		} else {
			return null;
		}


	}

	@Override
	public void blockUnlock(int blockHistoryNo) {
		
		userPageDao.blockUnlock(blockHistoryNo);
		
	}
}