package com.nosolorice.app.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChattingHandler extends TextWebSocketHandler {

    private List<WebSocketSession> sessionList = new ArrayList<>();
    private Map<WebSocketSession, String> userRoomMap = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String username = (String) session.getAttributes().get("username");
        String ageGroup = (String) session.getAttributes().get("matchingAge");
        String gender = (String) session.getAttributes().get("matchingGender");
        String category1 = (String) session.getAttributes().get("matchingCateOption1");
        String category2 = (String) session.getAttributes().get("matchingCateOption2");
        String category3 = (String) session.getAttributes().get("matchingCateOption3");
        

        String roomName = determineRoomName(ageGroup, gender, category1, category2, category3);
        userRoomMap.put(session, roomName);

        sessionList.add(session);
        System.out.println(username + " entered room: " + roomName);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String username = (String) session.getAttributes().get("username");
        String roomName = userRoomMap.get(session);

        for (WebSocketSession s : sessionList) {
            if (userRoomMap.get(s).equals(roomName)) {
                s.sendMessage(new TextMessage(username + ": " + message.getPayload()));
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String username = (String) session.getAttributes().get("username");
        String roomName = userRoomMap.get(session);

        sessionList.remove(session);
        userRoomMap.remove(session);

        System.out.println(username + " left room: " + roomName);
    }

    private String determineRoomName(String ageGroup, String gender, String category1, String category2, String category3) {
        return ageGroup + "_" + gender + "_Room";
    }
}
