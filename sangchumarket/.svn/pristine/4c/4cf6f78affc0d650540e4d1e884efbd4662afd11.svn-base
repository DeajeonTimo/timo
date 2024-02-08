package sangchu.chat.vo;

public class ChatVO {
	
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.07 12:29
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.10 00:23
		
		수정내역
		2023.08.10 00:23 - 김석호 : 채팅방 목록 출력문을 위한 거래게시글 제목 필드 및 게터세터 추가
	*/
	// 채팅방 번호, 거래번호, 대화상대, 를 가지고있는 VO객체
	
	// 채팅방 번호
	private String c_no;
	
	// 거래 번호
	private String t_no;
	// 거래글 작성자 -> 거래대화의 거래번호로 거래에서 작성자를 가지고 온다. 여기있는 정보로 가져다 작성자로 접근해야함.
	// 거래글 작성자의 컬럼 이름도 email이라서 같은 객체 VO에다 담을 수가 없네요..
	
	// 대화 상대 ( 작성자X 작성자에게 대화 시도를 한 사람의 email)
	private String email;
	
	// 해당 거래번호의 거래게시글 제목
	private String tb_title;
	
	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getT_no() {
		return t_no;
	}

	public void setT_no(String t_no) {
		this.t_no = t_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTb_title() {
		return tb_title;
	}

	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	} 
	
}
