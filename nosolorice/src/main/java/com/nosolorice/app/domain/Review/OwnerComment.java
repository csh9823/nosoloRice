package com.nosolorice.app.domain.Review;

import java.sql.Timestamp;

public class OwnerComment {
	private int ownerNo;						// No
	private String businessComment;		// 사장님 댓글
	private Timestamp regDate;						// 사장님 댓글 등록일
	private int reviewNo;						// 리뷰 번호
	private String normalId;					// 유저 아이디 ==> 리뷰번호가 있는데 사용이유??
	private String businessId;				// 사업자 아이디
	
}
