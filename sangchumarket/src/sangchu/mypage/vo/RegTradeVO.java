package sangchu.mypage.vo;

public class RegTradeVO {
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.11 09:48
		
		
		
		본인이 등록한 거래글을 가져오기 위한 VO객체입니다.
		필요 정보
		t_no : 거래번호
		tb_tilte : 거래글제목
		t_state : 거래 상태
		t_type : 거래 유형
	*/
	
	private String t_no; 
	private String tb_title;
	private String t_state;
	private String t_type;
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
	public String getT_type() {
		return t_type;
	}
	public void setT_type(String t_type) {
		this.t_type = t_type;
	}
	public String getT_state() {
		return t_state;
	}
	public void setT_state(String t_state) {
		this.t_state = t_state;
	}
}