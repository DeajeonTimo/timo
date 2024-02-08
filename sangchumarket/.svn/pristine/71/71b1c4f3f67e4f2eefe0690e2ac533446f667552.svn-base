package sangchu.adminMode.service;


import java.util.List;

import sangchu.adminMode.dao.AdminModeDaoImpl;
import sangchu.adminMode.vo.EnquiryNUsersVO;
import sangchu.adminMode.vo.EnquiryVO;
import sangchu.main.vo.MemberVO;

public class AdminModeServiceImpl implements IAdminModeService{
	private static AdminModeServiceImpl service;
	private AdminModeDaoImpl dao;
	private AdminModeServiceImpl() {
		dao = AdminModeDaoImpl.getInstance();
	}
	public static AdminModeServiceImpl getInstance() {
		if(service==null)service=new AdminModeServiceImpl();
		return service;
	}
	@Override
	public MemberVO searchUserEmail(String email) {
		return dao.searchUserEmail(email);
	}
	@Override
	public int updateStopdate(String email) {
		return dao.updateStopdate(email);
	}
	@Override
	public int countUsersHavingStopdate() {
		return dao.countUsersHavingStopdate();
	}
	@Override
	public List<MemberVO> getAllUSeraStopdate() {
		return dao.getAllUSeraStopdate();
	}
	@Override
	public int clearStopdateAll() {
		return dao.clearStopdateAll();
	}
	@Override
	public int clearStopdate(String email) {
		return dao.clearStopdate(email);
	}
	@Override
	public List<EnquiryVO> getAllEnquiry() {
		return dao.getAllEnquiry();
	}
	@Override
	public EnquiryVO getEnquiry(String e_no) {
		// TODO Auto-generated method stub
		return dao.getEnquiry(e_no);
	}
	@Override
	public int setStopdate(MemberVO memVO) {
		return dao.setStopdate(memVO);
	}
	@Override
	public EnquiryNUsersVO getStopdateNEnquiry(String e_target) {
		// TODO Auto-generated method stub
		return dao.getStopdateNEnquiry(e_target);
	}
	@Override
	public int countTradeLCat(String lCat) {
		return dao.countTradeLCat(lCat);
	}
	
}
