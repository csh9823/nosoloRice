package com.nosolorice.app.hyuncontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


@ServerEndpoint("/matching")
public class MatchingServer {
	
	private final ObjectMapper om = new ObjectMapper();
	
    @OnOpen
    public void onOpen(Session session) {
    	System.out.println(session + "님이 Matching 웹소켓 서버에 연결되었습니다");
    }
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	
    	// 받은 메시지를 객체화 시키기
    	Map<String, Object> dataMap = om.readValue(message, new TypeReference<Map<String, Object>>() {});
        
    	System.out.println("위치메서드 : " + dataMap.get("locationMethod").toString());
    	
    	//위치설정 방법이 '주소'라면 좌표로 변환
    	if(dataMap.get("locationMethod").toString().equals("address")) {
    		//여기서 주소를 좌표로 변환
    		System.out.println("주소 정보 : ");
    		System.out.println(dataMap.get("locationInfo").toString());
    	} else {
    		System.out.println("지도 좌표 : ");
    		System.out.println(dataMap.get("locationInfo").toString());
    	}
    	
    	// 메시지로 받은 사용자의 정보 및 매칭 설정정보를 세션에 저장 
    	session.getUserProperties().put("memberCount", dataMap.get("memberCount"));
    	session.getUserProperties().put("locationMethod", dataMap.get("locationMethod"));
    	session.getUserProperties().put("locationInfo", dataMap.get("locationInfo"));
    	Collections.sort((ArrayList<String>) dataMap.get("category"));
    	session.getUserProperties().put("category", dataMap.get("category"));
    	session.getUserProperties().put("gender", dataMap.get("gender"));
    	session.getUserProperties().put("age", dataMap.get("age"));
    	session.getUserProperties().put("sessionGender", dataMap.get("sessionGender"));
    	
    	//매칭 진행
    	
    	//매칭된 멤버를 담을 빈 set객체를 생성 후 자기 자신을 넣는다.
    	Set<Session> matchingMember = new HashSet<>();
    	matchingMember.add(session);
    	
    	//매칭된 인원(나 포함)
    	int matchingCount = 1;
    	
    	//매칭멤버 set 객체
    	Set<Session> sessions = session.getOpenSessions();
    	System.out.println("sessions : " + sessions.toString());
    	
    	for (Session s : sessions) {
    		if(s != session && Integer.parseInt(dataMap.get("memberCount").toString()) == Integer.parseInt(s.getUserProperties().get("memberCount").toString())) {
    			
    			boolean option = true;
    			
    			//매칭 선택조건
    			
    			// 위치메서드 조건(address)
    			if(dataMap.get("locationMethod").toString().equals("address")) {
    				option = dataMap.get("locationMethod").toString().equals(s.getUserProperties().get("locationMethod").toString()) ? true : false;
    				if(option) {
    					option = dataMap.get("locationInfo").toString().equals(s.getUserProperties().get("locationInfo").toString()) ? true : false;
    				}
    			}
    			// 위치메서드 조건(map)   			
    			if(dataMap.get("locationMethod").toString().equals("map")) {
    				option = dataMap.get("locationMethod").toString().equals(s.getUserProperties().get("locationMethod").toString()) ? true : false;
    				if(option) {
    			    	ArrayList<Object> list = (ArrayList<Object>) dataMap.get("locationInfo");
    			    	double area = Integer.parseInt((String)list.get(2)) * 0.00898315;
    			    	double maxX = (double) list.get(0) + area;
    			    	double minX = (double) list.get(0) - area;
    			    	double maxY = (double) list.get(1) + area;
    			    	double minY = (double) list.get(1) - area;
    			    	//s의 x y좌표가 내 4개 좌표 안에 속하기만 하면된다.
    			    	ArrayList<Object> sList = (ArrayList<Object>) s.getUserProperties().get("locationInfo");
    			    	double sX = (double) sList.get(0);
    			    	double sY = (double) sList.get(1);
    			    	option = (sX >= minX && sX <= maxX && sY >= minY && sY <= maxY) ? true : false;
    				}
    			}
    			
    			// 카테고리 조건
    			if(! dataMap.get("category").toString().equals("[]")) {
    		    	ArrayList<Object> cList = (ArrayList<Object>) dataMap.get("category");
    		    	ArrayList<Object> scList = (ArrayList<Object>) s.getUserProperties().get("category");
    				option = cList.equals(scList) ? true : false;
    			}
    			// 같은성별여부 조건
    			if(! dataMap.get("gender").toString().equals("no")) {
    				option = dataMap.get("sessionGender").toString().equals(s.getUserProperties().get("sessionGender").toString()) ? true : false;
    			}
    			// 같은 연령대 조건
    			if(Integer.parseInt(dataMap.get("age").toString()) != 0 ) {
    				option = Integer.parseInt(dataMap.get("age").toString()) == Integer.parseInt(s.getUserProperties().get("age").toString()) ? true : false;
    			}		
    			
    			//매칭조건이 모두 맞았을 때 matchingMember Set에 넣는다.
    			if(option) {
    				matchingMember.add(s);
    			}
    		}
    		if(matchingMember.size() == Integer.parseInt((String) dataMap.get("memberCount"))) break;
    	}
    	    	
    	if(matchingMember.size() == Integer.parseInt((String) dataMap.get("memberCount"))) {
    		//여기서부터 정보를 담아서 채팅방으로 이동하자
    		
    		//멤버의 수
    		int memberCount = matchingMember.size();
    		
    		//채팅방의 아이디 UUID로 생성
    		UUID roomId = UUID.randomUUID();
    		
    		double[] centerPoint = new double[2];
    		//locationMethod가 지도면 중심점
    		if(dataMap.get("locationMethod").toString().equals("map")) {
    			    			
    			ArrayList<Double> xList = new ArrayList<>(matchingMember.size());
    			ArrayList<Double> yList = new ArrayList<>(matchingMember.size());
    			
    			for(Session m : matchingMember) {
    				ArrayList<Object> list = (ArrayList<Object>) m.getUserProperties().get("locationInfo");
			    	double x = (double) list.get(0);
			    	double y = (double) list.get(1);
    				xList.add(x);
    				yList.add(y);
    			}
    	        
    			double minX = Collections.min(xList);
    			double maxX = Collections.max(xList);
    			double minY = Collections.min(yList);
    			double maxY = Collections.max(yList);
    			
    			centerPoint[0] = (minX + maxX)/2;
    			centerPoint[1] = (minY + maxY)/2;
    		}
    		
    		String address = "";
    		//locationMethod가 주소면 주소
    		if(dataMap.get("locationMethod").toString().equals("address")) {
    			address = dataMap.get("locationInfo").toString();
    		}
    		
    		// 최종적으로 클라이언트에게 보낼 메시지 객체
            Map<String, Object> data = new HashMap<>();
            data.put("success", true);
            data.put("memberCount", memberCount);
            data.put("roomId", roomId);
            data.put("locationMethod", dataMap.get("locationMethod").toString());
            if(dataMap.get("locationMethod").toString().equals("map")) data.put("locationInfo", Arrays.toString(centerPoint));
            else data.put("locationInfo", address);
            
            //Map을 json문자열로 변환
            String jsonData = om.writeValueAsString(data);
            //변환한 json문자열을 클라이언트에 반환
            for(Session m : matchingMember) {
            	m.getBasicRemote().sendText(jsonData);            	
            }
            
            
            
    	}    
    }
    
    @OnClose
    public void onClose(Session session) throws IOException {
    	System.out.println(session.getId() + "님의 웹소켓 연결이 해제되었습니다.");
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("웹소켓 통신 에러");
        throwable.printStackTrace();
    }
	
}
