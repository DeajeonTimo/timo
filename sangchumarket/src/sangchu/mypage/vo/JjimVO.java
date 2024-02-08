package sangchu.mypage.vo;
/*
	최초 작성자 : 김석호
	최초 작성일 : 2023.08.10 15:00
	
	최근 수정자 : 김석호
	최근 수정일 : 2023.08.10 16:21
	
	수정 내역
	2023.08.10 16:21 - 김석호 : 거래구분필드 삭제, 거래상태필드 추가
	
	유저가 소유한 찜 목록을 출력하기 위한 VO객체입니다.
*/


public class JjimVO {
	private String email;
	private String t_no;
	private String tb_title;
	private String t_state;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getTb_title() {
		return tb_title;
	}
	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}
	public String getT_state() {
		return t_state;
	}
	public void setT_state(String t_state) {
		this.t_state = t_state;
	}
}