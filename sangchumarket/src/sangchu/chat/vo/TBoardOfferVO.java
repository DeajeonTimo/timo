package sangchu.chat.vo;

public class TBoardOfferVO {
	private int tb_price;
	private double tb_loc;
	private double tb_loc2;
	public int getTb_price() {
		return tb_price;
	}
	public void setTb_price(int tb_price) {
		this.tb_price = tb_price;
	}
	public double getTb_loc() {
		return tb_loc;
	}
	public void setTb_loc(double tb_loc) {
		this.tb_loc = tb_loc;
	}
	public double getTb_loc2() {
		return tb_loc2;
	}
	public void setTb_loc2(double tb_loc2) {
		this.tb_loc2 = tb_loc2;
	}
	@Override
	public String toString() {
		return "TBoardOfferVO [tb_price=" + tb_price + ", tb_loc=" + tb_loc + ", tb_loc2=" + tb_loc2 + "]";
	}
}