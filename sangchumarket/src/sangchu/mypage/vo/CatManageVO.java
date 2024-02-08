package sangchu.mypage.vo;

public class CatManageVO {
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.15 23:43
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.16 10:40
		
		수정 내역
		2023.08.16 07:49 - 김석호 : 게터세터..추가
		2023.08.16 09:35 - 김석호 : 중분류 이름 삭제
		2023.08.16 10:40 - 김석호 : 중분류 이름 재등록
		
		마이페이지에서 관심카테고리 관리와 관련된 기능을 처리하기 위한 VO객체입니다
		U_INTEREST 테이블
	*/
	
	// 유저 이메일
	private String email;
	
	// 중분류코드
	private String c_middlecat;
	
	// 중분류 이름
	private String c_name;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getC_middlecat() {
		return c_middlecat;
	}

	public void setC_middlecat(String c_middlecat) {
		this.c_middlecat = c_middlecat;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
}
