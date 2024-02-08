package sangchu.chat.vo;

public class ChatMessageVO {
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.08 18:07
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.09 14:36
		
		채팅JSP에서 온 메시지를 처리하기 위한 VO객체
		
		수정이력 : 닉네임 필드 추가 2023.08.09 14:36
		
	*/
	private String command;
	private String room;
	private String message;
	private String email;
	private String nickname;
	
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "ChatMessageVO [command=" + command + ", room=" + room + ", message=" + message + ", email=" + email
				+ ", nickname=" + nickname + "]";
	}
	
	
	
	
}