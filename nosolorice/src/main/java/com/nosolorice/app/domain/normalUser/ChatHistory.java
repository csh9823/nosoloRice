package com.nosolorice.app.domain.normalUser;

import java.sql.Timestamp;

public class ChatHistory {
	private int chatNo;				// No
	private String normalId;		// 유저아이디
	private String nickName;
	private String chatName;		// 채팅방 이름
	private String chatType;
	private String chatMessage;		// 채팅내역
	private Timestamp chatRegDate;	// 채팅날짜
	public ChatHistory() {
		
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getNormalId() {
		return normalId;
	}
	public void setNormalId(String normalId) {
		this.normalId = normalId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public String getChatMessage() {
		return chatMessage;
	}
	public void setChatMessage(String chatMessage) {
		this.chatMessage = chatMessage;
	}
	public Timestamp getChatRegDate() {
		return chatRegDate;
	}
	public void setChatRegDate(Timestamp chatRegDate) {
		this.chatRegDate = chatRegDate;
	}
	public String getChatType() {
		return chatType;
	}
	public void setChatType(String chatType) {
		this.chatType = chatType;
	}
	@Override
	public String toString() {
		return "ChatHistory [chatNo=" + chatNo + ", normalId=" + normalId + ", nickName=" + nickName + ", chatName="
				+ chatName + ", chatType=" + chatType + ", chatMessage=" + chatMessage + ", chatRegDate=" + chatRegDate
				+ "]";
	}
	
	
	
}
