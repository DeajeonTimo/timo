package sangchu.trade.vo;

public class TradeVO {

	//거래테이블 VO
	//상품등록시 필요한 컬럼들..

	private String t_no;
	private String c_middlecat;
	private String email;
	private String t_type;
	private String t_date;
	private String t_recentdate;
	private String t_state;
	
	public void TradeVO() {}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getC_middlecat() {
		return c_middlecat;
	}
	public void setC_middlecat(String c_middlecat) {
		this.c_middlecat = c_middlecat;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getT_type() {
		return t_type;
	}
	public void setT_type(String t_type) {
		this.t_type = t_type;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public String getT_recentdate() {
		return t_recentdate;
	}
	public void setT_recentdate(String t_recentdate) {
		this.t_recentdate = t_recentdate;
	}
	public String getT_state() {
		return t_state;
	}
	public void setT_state(String t_state) {
		this.t_state = t_state;
	}

	@Override
	public String toString() {
		return "TradeVO [t_no=" + t_no + ", c_middlecat=" + c_middlecat + ", email=" + email + ", t_type=" + t_type
				+ ", t_date=" + t_date + ", t_recentdate=" + t_recentdate + ", t_state=" + t_state + "]";
	}


	


} 
