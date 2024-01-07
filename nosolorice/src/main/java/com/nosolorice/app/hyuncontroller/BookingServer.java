package com.nosolorice.app.hyuncontroller;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@ServerEndpoint("/booking/{businessId}")
public class BookingServer {
	
	private final ObjectMapper om = new ObjectMapper();
	
    @OnOpen
    public void onOpen(Session session, @PathParam("businessId") String businessId) throws JsonProcessingException {
    	System.out.println(session + "님이 " + businessId + "채팅방에 연결 되었습니다");
    }
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {    	
    	System.out.println("서버에서 메시지 수신완료 : " + message);
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


