package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;

public class LprodServiceImpl implements ILprodService{

	private static LprodServiceImpl instance;
	
	private LprodDaoImpl dao;
	
	private LprodServiceImpl() {
		dao = LprodDaoImpl.getInstance();
	}
	
	public static LprodServiceImpl getInstance(){
		if(instance==null) {
			instance = new LprodServiceImpl();
		}
		return instance;
	}
	
	@Override
	public List<LprodVO> selctLprod() {
		
		return dao.selctLprod();
	}
	
	

}
