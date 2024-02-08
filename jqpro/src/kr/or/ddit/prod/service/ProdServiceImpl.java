package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdServiceImpl implements IProdService {

	private ProdDaoImpl dao = null;
	private static ProdServiceImpl instance;
	
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}
	
	public static ProdServiceImpl getInstance() {
		if(instance==null) {
			instance = new ProdServiceImpl();
		}
		return instance;
	}
	
	
	
	
	
	@Override
	public List<ProdVO> selectByLgu(String lprod_gu) {
		return dao.selectByLgu(lprod_gu);
	}
	@Override
	public ProdVO selectById(String prodId) {
		return dao.selectById(prodId);
	}

}
