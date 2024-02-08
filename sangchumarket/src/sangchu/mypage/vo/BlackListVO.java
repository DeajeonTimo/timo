package sangchu.mypage.vo;

public class BlackListVO {
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.16 15:11
		
		U_BLAKCLIST 테이블을 관리하기 위한 VO객체입니다.
		email 테이블 두개를 조인해서 하나는 유저, 하나는 대상의 email을 일치시킵니다.
		대상의 email을 일치신 테이블에서 필드 u_nick값을 가져옵니다.
	*/
	
	// 유저의 이메일
	private String email;
	
	// 차단 대상의 email -> 백단에서 갖고만있고 실제로 앞단에 표시해주지 않는다.
	private String p_email;
	
	// 차단 대상의 nickname -> 앞단에 표시하는 용도로 가지고다닌다.
	private String u_nick;
	
	private String p_date;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	} 
	
	
	
}
