package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.util.MybatisUtil;

public class BuyerDaoImpl implements IBuyerDao {

	private static BuyerDaoImpl instance;
	
	private BuyerDaoImpl() { }
	
	public static BuyerDaoImpl getInstance() {
		if(instance==null) instance= new BuyerDaoImpl();
		return instance;
	}
	
	@Override
	public List<BuyerVO> selectBuyerName() {
		List<BuyerVO> list = null;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("buyer.selectBuyerName");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public BuyerVO selectAllByName(String name) {
		BuyerVO vo = null;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("buyer.selectAllByName",name);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return vo;
	}

}
