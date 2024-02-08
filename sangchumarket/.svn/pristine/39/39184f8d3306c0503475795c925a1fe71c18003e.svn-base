package sangchu.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import sangchu.chat.service.ChatServiceImpl;
import sangchu.chat.service.IChatService;
import sangchu.chat.vo.ChatDetailVO;
import sangchu.chat.vo.ChatMessageVO;
import sangchu.chat.vo.ChatUserVO;


@ServerEndpoint("/webSocketSangchuTalk.do")
public class WebSocketSangchuTalk {
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.09 08:30
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.10 02:40
		
		수정이력 :
		2023.08.09 19:50 - 김석호 : 맵퍼 구현 후 insert 처리, connection시 세션정보 처리 수정
		2023.08.09 22:10 - 김석호 : 필요없는 기능,주석 제거 / 설명용 주석 추가
		2023.08.10 02:40 - 김석호 : 채팅방 채팅출력에서 이미지소스 불러오기 위해 메시지에 email 추가전달, 해당 메소드 매개변수 추가
	*/
	// 유저 집합 리스트
	// key : 채팅방 번호
	// value : List<유저 세션정보가 들어있는 객체>   >> key값에 있는 채팅방에 현재 접속한 세션정보 관리
	private static Map<String, List<ChatUserVO>> sessionUsersMap = 
			Collections.synchronizedMap(new HashMap<String, List<ChatUserVO>>());
	private IChatService service;
	
	/**
	 * 웹 소켓이 접속되면 전체방의 유저리스트에 세션을 넣는다.
	 * @param userSession 웹 소켓 세션
	 */
	@OnOpen
	public void handleOpen(Session userSession){
		service = ChatServiceImpl.getInstance();
		if(!sessionUsersMap.containsKey("firstConnection")) {
			// 처음 접속자가 스쳐지나가는 곳 접속자의 세션정보가 담긴 ChatUserVO객체를 LIST에 담아 저장
			sessionUsersMap.put("firstConnection", new ArrayList<ChatUserVO>() );
		}
		ChatUserVO chatUserVO = new ChatUserVO(null, userSession);
		sessionUsersMap.get("firstConnection").add(chatUserVO);
	}
	
	/**
	 * 웹 소켓으로부터 메시지가 오면 호출한다.
	 * @param message 메시지
	 * @param userSession
	 * @throws IOException
	 */
	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException{
		String userNick = (String)userSession.getUserProperties().get("usernick");
		String userMail = (String)userSession.getUserProperties().get("usermail");
		String c_no = (String) userSession.getUserProperties().get("c_no");
		System.out.println("&&&&&& username = " + userMail);
		System.out.println("++++++ room = " + c_no);
		
		// JSON구조의 문자열로 온 메시지를 객체형으로 변환한다.
		Gson gson = new Gson();
		// 메시지가 왔을때 온 JSON객체를 VO로 변환
		
		ChatMessageVO chatMessageVo = gson.fromJson(message, ChatMessageVO.class);
		// {"command" : "명령종류", "room" : "채팅방번호", "message" : "메시지", "nickname" : "로그인유저vo의 닉네임정보" ,"email" : "로그인유저vo의이메일정보" }
		System.out.println("도착한 JSON형태의 메시지 :" + chatMessageVo);
		
		// 세션 프로퍼티에 username이 없으면 username을 선언하고 해당 세션으로 메시지를 보낸다.(json 형식이다.)
		// 최초 메시지는 email과 채팅방번호를 받아서 설정한다.
		// 처음에 접속하면 접속할 때 보낸 채팅방으로 옮긴다.
		if(userMail == null || "connect".equals(chatMessageVo.getCommand()) ){
			for(ChatUserVO chatUserVo : sessionUsersMap.get("firstConnection")){
				// 지금 메시지를 보낸 세션이 처음 접속해서 대기중인 목록에 있는 그! 본인의 세션과 같다면.
				if(userSession.equals(chatUserVo.getUserSession())){
					chatUserVo.setUserInfo(chatMessageVo.getEmail());
					userSession.getUserProperties().put("usermail", chatMessageVo.getEmail() );
					userSession.getUserProperties().put("usernick", chatMessageVo.getNickname() );
					//userSession.getUserProperties().put("room", "전체");
					userSession.getUserProperties().put("c_no", chatMessageVo.getRoom() );
					// 채팅방 번호를 프로퍼티에 세팅.
					// 이후 userMap에서 first커넥션에서 지운 후 룸넘버에 맞춰서 옮겨주는 과정이 필요하다.
					if(!sessionUsersMap.containsKey(chatMessageVo.getRoom())) {
						sessionUsersMap.put(chatMessageVo.getRoom(), new ArrayList<ChatUserVO>());
					}
					ArrayList<ChatUserVO> list = (ArrayList<ChatUserVO>) sessionUsersMap.get(chatMessageVo.getRoom());
					list.add(chatUserVo);
					// 해당 채팅방에 있는 유저정보를 갱신한다.
					sessionUsersMap.put(chatMessageVo.getRoom(), list);
					// 처음 접속용으로 세팅해놓은 세션은 삭제한다.
					sessionUsersMap.get("firstConnection").remove(chatUserVo);
					return;
				}
			}
		} // 여기가 첫메시지 connect command 처리 부분 끝

		
		if("message".equals(chatMessageVo.getCommand()) ){
			// send메시지부터 채팅 디테일 VO로 만들어서 처리해야겠어.
			ChatDetailVO detailVO = new ChatDetailVO();
			detailVO.setC_no(c_no);
			detailVO.setChat_content(chatMessageVo.getMessage());
			detailVO.setEmail(userMail);
			IChatService service = ChatServiceImpl.getInstance();
			
			/*
			 *************************************************
				여기서 먼저 채팅 디테일에 세팅해서 채팅 로그 insert 해줘야 함!!!!!!!!!!!
			 *************************************************
			 */
			int res = service.insertChatLog(detailVO);
			// insert한 결과가 0보다 클 경우에만 전체로 보내주고, 0일경우에는 본인의 세션에만 오류메시지를 날려준다.
			if(res>0) {
				sendToAll(c_no, userNick, chatMessageVo.getMessage(),userMail);
			}else {
				userSession.getBasicRemote().sendText(buildJsonData("system","오류발생",null));
			}
			
		}
		
		if("runout".equals(chatMessageVo.getCommand())) {
			// runout command는 jsp에서 웹소켓onclose함수가 실행될때 보내지는 함수이기때문에 다른 작업을 해줄 필요가 없다.
			// 여기서 해당 채팅방번호에 List사이즈를 확인한 후 0일 경우 Map에서 지워버리는 작업이 필요하다.
			if(sessionUsersMap.get(c_no).size()==0) {
				sessionUsersMap.remove(c_no);
			}
		}
		
		
		
	} // onMessage 끝

	
	/**
	 * 해당 채팅방 전체에게 메시지를 보낸다.
	 * @param room 채팅방이름
	 * @param username 유저 닉네임
	 * @param message 메시지
	 * @param usermail 유저 이메일
	 * @throws IOException
	 */
	public void sendToAll(String room, String username, String message,String usermail) throws IOException{
		// username이 있으면 채팅방 전체에게 메시지를 보낸다.
		if(sessionUsersMap.containsKey(room)) {
															//룸 정보에 들은 애를 빼서 순서대로 보냄..?
			// 유저네임이 본인이랑 같아도 그냥 보냄. 왼쪽 으론쪽에 정력해서 출력하는건 jsp에서 받아서 처리
			Iterator<ChatUserVO> iterator = sessionUsersMap.get(room).iterator();
			while(iterator.hasNext()){
				
				iterator.next().getUserSession().getBasicRemote().sendText(buildJsonData(username, message,usermail));
			}
		}
	}
	
	/**
	 * 웹소켓을 닫으면 해당 유저를 유저리스트에서 뺀다.
	 * @param userSession
	 * @throws IOException */
	@OnClose
	public void handleClose(Session userSession) throws IOException{
		String room = (String) userSession.getUserProperties().get("c_no");
		Iterator<ChatUserVO> chatIter = sessionUsersMap.get(room).iterator();
		while(chatIter.hasNext()){
			ChatUserVO chatVo = chatIter.next();
			if(userSession.equals(chatVo.getUserSession())){
				chatIter.remove();
			}
		}
	}
	
	/**
     * 웹 소켓이 에러가 나면 호출되는 이벤트
     * @param t
     */
    @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
    
	
	/**
	 * json타입의 메시지 만들기
	 * @param username 메시지를 보낸 사람의 nick(세션에서 usernick키값으로 저장되어있는 프로퍼티값
	 * @param message
	 * @param username 메시지를 보낸 사람의 이메일(세션에서 usermail키값으로 저장되어있는 프로퍼티값
	 * @return
	 */
	public String buildJsonData(String username, String message,String usermail /*, Session userSession*/){
		Gson gson = new Gson();
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		// jsp에서 json을 해제할때 메시지 따로, 보낸 사용자의 닉네임을 따로 구분해서 처리할 수 있게 만들어준다.
		if(message!=null) {
			jsonMap.put("message", message);
		}
		jsonMap.put("user", username);
		jsonMap.put("usermail", usermail);
		String strJson = gson.toJson(jsonMap);
		return strJson;
	}
}





