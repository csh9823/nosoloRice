package com.nosolorice.app.jindao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nosolorice.app.domain.booking.Booking;

@Repository
public class JinBookingDaoImpl implements JinBookingInterfaceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.nosolorice.app.mapper.JinBooking";
	
	@Override
	public List<Booking> BookingList(String businessId) {
				
		
		return sqlSession.selectList(NAME_SPACE + ".BookingList",businessId);
	}

}
