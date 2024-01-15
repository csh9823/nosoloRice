package com.nosolorice.app.hyuncontroller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint("/booking/{businessId}")
public class BookingServer {
	
	private final ObjectMapper om = new ObjectMapper();
	
    @OnOpen
    public void onOpen(Session session, @PathParam("businessId") String businessId) throws JsonProcessingException {
    	System.out.println(session + "님이 " + businessId + "예약관리 서버에 연결 되었습니다");
    }
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {    	
    	System.out.println("서버에서 메시지 수신완료 : " + message);
    	
    	//json문자열로 도착한 메시지를 Map객체로 바꾼다. 
    	Map<String, Object> msg = om.readValue(message, new TypeReference<Map<String, Object>>() {});
    	//현재 접속 세션Set
    	Set<Session> sessions = session.getOpenSessions();
    	
    	System.out.println("예약관리서버에서 날것의 message : " + message);
    	System.out.println("예약관리서버에서 Map객체 msg : " + msg);
    	
    	//메시지 type이 connect이면
    	if(msg.get("type").equals("connect")) {
    		//서버에 접속되면 각자의 세션에 메시지로 도착한 자신의 loginId와 roomId를 저장.
    		String loginId = (String)msg.get("loginId");
    		String roomId = (String)msg.get("roomId");
    		session.getUserProperties().put("loginId", loginId);
    		session.getUserProperties().put("roomId", roomId);
    		System.out.println("서버가 받은 메시지가 connect일때 저장된 loginId : " + session.getUserProperties().put("loginId", loginId)); 
    		System.out.println("서버가 받은 메시지가 connect일때 저장된 roomId : " + session.getUserProperties().put("roomId", roomId)); 
    		return;
    	}
    	
    	//메시지 type이 request이면 
    	if(msg.get("type").equals("request")) {
    		//유저가 보내준 buisinessId를 가진 유저에게 답장 { type : 'request', roomId : roomId }
    		String businessId = (String)msg.get("businessId");
    		System.out.println("예약관리 서버에서 businessId : " + businessId);
    		String roomId = (String)msg.get("roomId");
    		System.out.println("예약관리 서버에서 roomId : " + roomId);
    		
    		
    		for(Session s : sessions) {
    			Object loginIdObj = s.getUserProperties().get("loginId");
    			if(loginIdObj.equals(businessId)) {
    				Map<String, Object>dataMap = new HashMap<>();
    				dataMap.put("type", "request");
    				dataMap.put("roomId", roomId);
	    			String jsonData = om.writeValueAsString(dataMap);
	    			s.getBasicRemote().sendText(jsonData);
	    			System.out.println("예약관리서버에서 사장에게 메시지 발송");
    			}
    		}
    		return;
    	}
    	
    	//메시지 type이 approve이면 
    	if(msg.get("type").equals("approve")) {
    		System.out.println("사장님이 보낸 날것 그대로의 승인메시지 : " + message);
    		System.out.println("사장님이 보낸 승인메시지 msg : " + msg);
    		//사장이 보내준 roomId를 가진 유저에게 답장 { type : 'approve'}
    		String roomId = (String)msg.get("roomId");
    		    		
    		for(Session s : sessions) {
    			if(s.getUserProperties().get("roomId").equals(roomId)) {
    				Map<String, Object>dataMap = new HashMap<>();
    				dataMap.put("type", "approve");
	    			String jsonData = om.writeValueAsString(dataMap);
	    			s.getBasicRemote().sendText(jsonData);
	    			System.out.println("유저들에게 사장님 예약승인 메시지 발송 완료");
    			}
    		}    		
    		return;
    	}
    	
    	//메시지 type이 reject이면 
    	if(msg.get("type").equals("reject")) {
    		System.out.println("사장님이 보낸 날것 그대로의 거부메시지 : " + message);
    		System.out.println("사장님이 보낸 거부메시지 msg : " + msg);
    		//사장이 보내준 roomId를 가진 유저에게 답장 { type : 'reject', reason: 거절사유 }
    		String roomId = (String)msg.get("roomId");
    		String reason = (String)msg.get("reason");
    		for(Session s : sessions) {
    			if(s.getUserProperties().get("roomId").equals(roomId)) {
    				Map<String, Object>dataMap = new HashMap<>();
    				dataMap.put("type", "reject");
    				dataMap.put("reason", reason);
	    			String jsonData = om.writeValueAsString(dataMap);
	    			s.getBasicRemote().sendText(jsonData);
	    			System.out.println("유저들에게 사장님 예약거부 메시지 발송 완료");
    			}
    		}    
    		return;
    	}
    	
    	//메시지 type이 userCancel이면 
    	if(msg.get("type").equals("userCancel")) {
    		System.out.println("유저들이 보낸 메시지 : " + message);
    		System.out.println("유저들이 보낸 메시지 msg : " + msg);
    		//사장에게 취소된 예약번호를 알림
    		String businessId = (String)msg.get("businessId");
    		String bookNo = (String)msg.get("bookNo");
    		for(Session s : sessions) {
    			if(s.getUserProperties().get("loginId").equals(businessId)) {
    				Map<String, Object>dataMap = new HashMap<>();
    				dataMap.put("type", "userCancel");
    				dataMap.put("bookNo", bookNo);
    				dataMap.put("businessId", businessId);
    				String jsonData = om.writeValueAsString(dataMap);
    				s.getBasicRemote().sendText(jsonData);
    				System.out.println("사장님에게 예약취소됬다고 메시지 발송 완료 : " + jsonData);
    			}
    		}    
    		return;
    	}

    	
    	
    }
    
    @OnClose
    public void onClose(Session session) throws IOException {
    	System.out.println(session.getUserProperties().get("loginId") + "님의 예약관리 서버 연결이 해제되었습니다.");
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("웹소켓 통신 에러 - 예약관리 서버");
        throwable.printStackTrace();
    }

}


