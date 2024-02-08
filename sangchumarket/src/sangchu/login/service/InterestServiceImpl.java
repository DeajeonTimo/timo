package sangchu.login.service;

import sangchu.login.dao.InterestDaoImpl;
import sangchu.login.vo.InterestVO;

public class InterestServiceImpl implements IInterestService{

	private static InterestServiceImpl service;
	private InterestDaoImpl dao;
	private InterestServiceImpl() {
		dao = InterestDaoImpl.getInstance();
	}
	public static InterestServiceImpl getInstatnce() {
		if(service==null)service=new InterestServiceImpl();
		return service;
	}
	
	
	@Override
	public int insertInterest(InterestVO interestVO) {
		return dao.insertInterest(interestVO);
	}

}
