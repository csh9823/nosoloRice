	package com.nosolorice.app.hyuncontroller;
	
	import java.io.IOException;
	import java.util.ArrayList;
	import java.util.Arrays;
	import java.util.Collections;
	import java.util.HashMap;
	import java.util.HashSet;
	import java.util.List;
	import java.util.Map;
	import java.util.Set;
	import java.util.UUID;
	
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpSession;
	import javax.websocket.EndpointConfig;
	import javax.websocket.OnClose;
	import javax.websocket.OnError;
	import javax.websocket.OnMessage;
	import javax.websocket.OnOpen;
	import javax.websocket.Session;
	import javax.websocket.server.HandshakeRequest;
	import javax.websocket.server.PathParam;
	import javax.websocket.server.ServerEndpoint;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Component;
	import org.springframework.stereotype.Controller;
	
	import com.fasterxml.jackson.core.JsonParseException;
	import com.fasterxml.jackson.core.JsonProcessingException;
	import com.fasterxml.jackson.core.type.TypeReference;
	import com.fasterxml.jackson.databind.JsonMappingException;
	import com.fasterxml.jackson.databind.ObjectMapper;
	import com.nosolorice.app.domain.normalUser.NormalUser;
	import com.nosolorice.app.hyunservice.UserService;
	
	@ServerEndpoint("/chating/{roomId}")
	public class ChatingServer {
		
		private final ObjectMapper om = new ObjectMapper();
    	//예약동의set
    	private static Map<String, Set<Session>> roomAgreeSets = new HashMap<>();
    	
	    @OnOpen
	    public void onOpen(Session session, @PathParam("roomId") String roomId) throws JsonProcessingException {
	    	System.out.println(session + "님이 " + roomId + "채팅방에 연결 되었습니다");
	    	session.getUserProperties().put("roomId", roomId);
	    	roomAgreeSets.putIfAbsent(roomId, new HashSet<>());
	    }
	    
	    @OnMessage
	    public void onMessage(String message, Session session) throws IOException {
	    	System.out.println(message);
	    	// 클라이언트에서 보낸 채팅메시지를 객체형태로 받는다
	    	Map<String, Object> msg = om.readValue(message, new TypeReference<Map<String, Object>>() {});
	    		    	
	        // 현재 세션의 roomId 가져오기
	        String currentRoomId = (String) session.getUserProperties().get("roomId");
	        Set<Session> agreeSet = roomAgreeSets.get(currentRoomId);	        
	        
	        
	        // 모든 열려있는 세션 가져오기
	        Set<Session> allSessions = session.getOpenSessions();
	        
	        // 현재 세션과 동일한 roomId를 가진 세션들을 chatMember로 묶기
	        Set<Session> chatMember = new HashSet<>();
	        for (Session s : allSessions) {
	            String roomId = (String) s.getUserProperties().get("roomId");
	            if (currentRoomId != null && currentRoomId.equals(roomId)) {
	                chatMember.add(s);
	            }
	        }

	    	
	    	
	    	if(msg.get("chatType").equals("connect")) {

	    		String nickName = (String)msg.get("nickName").toString();
	    		session.getUserProperties().put("nickName", nickName);
	    		
	    		Set<String> nickNames = new HashSet<>();
	    		Map<String, Object>dataMap = new HashMap<>();
	    		
	    		for(Session s : chatMember) {
	    			if(s.getUserProperties().get("nickName") != null) nickNames.add(s.getUserProperties().get("nickName").toString());
	    		}
	    		for(Session s : chatMember) {
	    			dataMap.put("chatType", "connect");
	    			dataMap.put("memberList", nickNames);
	    			String jsonData = om.writeValueAsString(dataMap);
	    			s.getBasicRemote().sendText(jsonData);
	    		}
	    		return;
	    	}
	    	
	    	//사장님 cancel이면 agreeSet 비우기
	    	if(msg.get("chatType").equals("denied")) {
	    		//소멸
	    		agreeSet.clear();
	    	}
	    	
	    	if(msg.get("chatType").equals("agree")) {
	    		System.out.println("agree메시지 수신 : " + msg.toString());
	    		Map<String, Object>dataMap = new HashMap<>();
	    		agreeSet.add(session);
	    		
	    		System.out.println("agreeSet.size() : " + agreeSet.size());
	    		System.out.println("Integer.parseInt(msg.get(\"memberCount\").toString()) : " + Integer.parseInt(msg.get("memberCount").toString()));
	    		for (Map.Entry<String, Set<Session>> entry : roomAgreeSets.entrySet()) {
	    		    System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
	    		}
	    		for(Session s : agreeSet) {
	    			System.out.println("agreeSet 반복문 : " + s.getUserProperties().get("nickName"));
	    		}
	    		
	    		if(agreeSet.size() == Integer.parseInt(msg.get("memberCount").toString())) {
		    		for(Session s : chatMember) {
		    			dataMap.put("chatType", "agreeComplete");
		    			String jsonData = om.writeValueAsString(dataMap);
		    			s.getBasicRemote().sendText(jsonData);    		
		    		}
		    		//소멸
		    		roomAgreeSets.remove((String) session.getUserProperties().get("roomId"));
		    		System.out.println("agreeComplete 후 agreeSet소멸 완료");
		    		
	    		} else {
	    			for(Session s : agreeSet) {
	    				dataMap.put("chatType", "agree");
	    				dataMap.put("agreeCount", agreeSet.size());
	    				String jsonData = om.writeValueAsString(dataMap);
	    				s.getBasicRemote().sendText(jsonData);				    				
	    			}
	    		}
	    		return;
	    	}
	    	
	    	if(msg.get("chatType").equals("agreeCancel")) {
	    		
	    		System.out.println("agreeCancel메시지 수신 : " + msg.toString());
	    		Map<String, Object>dataMap = new HashMap<>();
	    		agreeSet.remove(session);
	    		System.out.println("agreeSet.size() : " + agreeSet.size());
	    		System.out.println("Integer.parseInt(msg.get(\"memberCount\").toString()) : " + Integer.parseInt(msg.get("memberCount").toString()));
	    		
    			for(Session s : agreeSet) {
    				dataMap.put("chatType", "agree");
    				dataMap.put("agreeCount", agreeSet.size());
    				String jsonData = om.writeValueAsString(dataMap);
    				s.getBasicRemote().sendText(jsonData);				    				
    			}
    			
	    		return;
	    	}
	    	
	    	if(msg.get("chatType").equals("reject")) {
	    		
	    		System.out.println("reject 메시지 수신 : " + msg.toString());
	    		Map<String, Object>dataMap = new HashMap<>();
	    		
	    		//소멸
	    		agreeSet.clear();
	    		
    			for(Session s : chatMember) {
    				dataMap.put("chatType", "reject");
    				String jsonData = om.writeValueAsString(dataMap);
    				s.getBasicRemote().sendText(jsonData);				    				
    			}
    			
	    		return;
	    	}
	    	
	    	if(msg.get("chatType").equals("userCancel")) {
	    		
	    		System.out.println("userCancel 메시지 수신 : " + msg.toString());
	    		Map<String, Object>dataMap = new HashMap<>();
	    		
    			for(Session s : chatMember) {
    				dataMap.put("chatType", "userCancel");
    				String jsonData = om.writeValueAsString(dataMap);
    				s.getBasicRemote().sendText(jsonData);				    				
    			}
    			
	    		return;
	    	}
	    	
	    	if(msg.get("chatType").equals("bookNo")) {
	    		
	    		System.out.println("bookNo 메시지 수신 : " + msg.toString());
	    		Map<String, Object>dataMap = new HashMap<>();
	    		int bookNo = Integer.parseInt(msg.get("bookNo").toString());
	    		
    			for(Session s : chatMember) {
    				dataMap.put("chatType", "bookNo");
    				dataMap.put("bookNo", bookNo);
    				String jsonData = om.writeValueAsString(dataMap);
    				s.getBasicRemote().sendText(jsonData);				    				
    			}
    			
	    		return;
	    	}
	    	
	    	if(msg.get("chatType").equals("quitPropose")) {
	    		
	    		System.out.println("quitPropose 메시지 수신 : " + msg.toString());
	    		Map<String, Object>dataMap = new HashMap<>();
	    		agreeSet.clear();
	    		
	    		for(Session s : chatMember) {
	    			dataMap.put("chatType", "quitPropose");
	    			String jsonData = om.writeValueAsString(dataMap);
	    			s.getBasicRemote().sendText(jsonData);				    				
	    		}
	    		
	    		return;
	    	}
	    	
	    	if(msg.get("chatType").equals("quitChatRoom")) {
	    		
	    		System.out.println("quitChatRoom 메시지 수신 : " + msg.toString());
	    		Map<String, Object>dataMap = new HashMap<>();
	    		agreeSet.clear();
	    		
	    		for(Session s : chatMember) {
	    			dataMap.put("chatType", "quitChatRoom");
	    			String jsonData = om.writeValueAsString(dataMap);
	    			s.getBasicRemote().sendText(jsonData);				    				
	    		}
	    		
	    		return;
	    	}
	    	
	    	
	    	
	    	//그냥 MSG일떄
    		for(Session s : chatMember) {
    			s.getBasicRemote().sendText(message);    		
    		}	
	    	
	    	
	    }
	    
	    @OnClose
	    public void onClose(Session session) throws IOException {
	    	System.out.println(session.getId() + "님의 웹소켓 연결이 해제되었습니다.");
	    	
	        // 현재 세션의 roomId 가져오기
	        String currentRoomId = (String) session.getUserProperties().get("roomId");
	        String nickName = (String) session.getUserProperties().get("nickName");

	        // 모든 열려있는 세션 가져오기
	        Set<Session> allSessions = session.getOpenSessions();
	        
	        // 현재 세션과 동일한 roomId를 가진 세션들을 chatMember로 묶기
	        Set<Session> chatMember = new HashSet<>();
	        for (Session s : allSessions) {
	            String roomId = (String) s.getUserProperties().get("roomId");
	            if (currentRoomId != null && currentRoomId.equals(roomId)) {
	                chatMember.add(s);
	            }
	        }
	        for(Session s : chatMember) {
	        	Map<String, Object> map = new HashMap<>();
	        	map.put("chatType", "userClose");
	        	map.put("closeNickName", nickName);
    			String jsonData = om.writeValueAsString(map);
    			s.getBasicRemote().sendText(jsonData);	
	        }
	    	
	    }
	
	    @OnError
	    public void onError(Session session, Throwable throwable) {
	        System.out.println("웹소켓 통신 에러");
	        throwable.printStackTrace();
	    }
	
	}
