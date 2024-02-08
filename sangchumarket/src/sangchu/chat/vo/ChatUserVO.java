package sangchu.chat.vo;

import java.util.List;

import javax.websocket.Session;


	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.08 11:02
		
		
		유저의 세션과 유저 정보, 해당 유저가 소유한 채팅방 목록을 변수로 갖는 VO객체
		// 주석 추가 2023.08.09 15:10 김석호 : 채팅방 목록이 필요할까?
	*/
public class ChatUserVO {
	private String userInfo;
	private Session userSession;
	private List<ChatVO> chatList;
	public ChatUserVO(String userInfo, Session userSession) {
		this.userInfo = userInfo;
		this.userSession = userSession;
	}
	
	public String getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
	public Session getUserSession() {
		return userSession;
	}
	public void setUserSession(Session userSession) {
		this.userSession = userSession;
	}
	public List<ChatVO> getChatList() {
		return chatList;
	}
	public void setChatList(List<ChatVO> chatList) {
		this.chatList = chatList;
	}
	
	
}
