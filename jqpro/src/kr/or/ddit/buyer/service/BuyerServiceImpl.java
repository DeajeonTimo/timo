package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.vo.BuyerVO;

public class BuyerServiceImpl implements IBuyerService {

private static BuyerServiceImpl instance;
private BuyerDaoImpl dao;
	
	private BuyerServiceImpl() {
		dao = BuyerDaoImpl.getInstance();
	}
	
	public static BuyerServiceImpl getInstance() {
		if(instance==null) instance= new BuyerServiceImpl();
		return instance;
	}
	
	
	@Override
	public List<BuyerVO> selectBuyerName() {
		
		return dao.selectBuyerName();
	}

	@Override
	public BuyerVO selectAllByName(String name) {
		
		return dao.selectAllByName(name);
	}

}
