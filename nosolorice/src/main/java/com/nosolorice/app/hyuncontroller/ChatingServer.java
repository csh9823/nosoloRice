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
	
    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") String roomId) throws JsonProcessingException {
    	System.out.println(session + "님이 " + roomId + "채팅방에 연결 되었습니다");
    }
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	
    	// 클라이언트에서 보낸 채팅메시지를 객체형태로 받는다
    	Map<String, Object> msg = om.readValue(message, new TypeReference<Map<String, Object>>() {});
    	
    	
    	Set<Session> chatMember = session.getOpenSessions();
    	if(msg.get("chatType").equals("connect")) {
    		String nickName = (String)msg.get("nickName").toString();
    		session.getUserProperties().put("nickName", nickName);
    		Set<String> nickNames = new HashSet<>();
    		Map<String, Object>dataMap = new HashMap<>();
    		for(Session s : chatMember) {
    			nickNames.add(s.getUserProperties().get("nickName").toString());
    		}
    		for(Session s : chatMember) {
    			dataMap.put("chatType", "connect");
    			dataMap.put("memberList", nickNames);
    			String jsonData = om.writeValueAsString(dataMap);
    			s.getBasicRemote().sendText(jsonData);    		
    		}
    	} else {
    		for(Session s : chatMember) {
    			s.getBasicRemote().sendText(message);    		
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
