package sangchu.mypage.vo;

public class ReviewVO {
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.12 20:27
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.13 01:56
		
		수정 내역
		불필요 주석 제거
		
		유저의 판매 횟수, 구매 횟수, 리뷰점수를 관리하기위한 VO객체입니다.
	*/
	
	// 판매수
	private int sell_cnt;
	
	// 구매수
	private int buy_cnt;
	
	// 받은 평점
	private double score;

	public int getSell_cnt() {
		return sell_cnt;
	}

	public void setSell_cnt(int sell_cnt) {
		this.sell_cnt = sell_cnt;
	}

	public int getBuy_cnt() {
		return buy_cnt;
	}

	public void setBuy_cnt(int buy_cnt) {
		this.buy_cnt = buy_cnt;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}
	
}