package sangchu.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.main.vo.MainProdVO;
import sangchu.tboard.vo.TBoardVO;

public class MainDaoImpl implements IMainDao {
	
	private static IMainDao dao;
	private MainDaoImpl() {}
	private SqlSession session;
	public static IMainDao getInstance() {
		if(dao==null) dao = new MainDaoImpl();
		return dao;
	}
	
	@Override
	public List<MainProdVO> hotItemRank(MainProdVO vo) {
		
		List<MainProdVO> list=null;
		try { 
			session=MybatisUtil.getSqlSession();
			list = session.selectList("mainProd.hotItemRank", vo);
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public List<MainProdVO> recentProd(MainProdVO vo) {
		
		List<MainProdVO> list = null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("mainProd.recentProd", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	

	@Override
	public int deleteInterest(MainProdVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("mainProd.deleteInterest", vo);
			if(cnt>0) {
				// 작업이 성공하면 AutoCommit이 비활성화된 상태이기 때문에 직접 commit을 실행해야 한다.
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null ) session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertInterest(MainProdVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("mainProd.insertInterest", vo);
			if(cnt>0) {
				// 작업이 성공하면 AutoCommit이 비활성화된 상태이기 때문에 직접 commit을 실행해야 한다.
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null ) session.close();
		}
		
		return cnt;
	}

	@Override
	public List<MainProdVO> selectUserCate(MainProdVO vo) {
		
		List<MainProdVO> list = null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("mainProd.selectUserCate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public List<MainProdVO> recentView(MainProdVO vo) {
			
		List<MainProdVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("mainProd.recentView", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int insertJjim(MainProdVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("mainProd.insertJjim", vo);
			if(cnt>0) {
				// 작업이 성공하면 AutoCommit이 비활성화된 상태이기 때문에 직접 commit을 실행해야 한다.
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null ) session.close();
		}
		
		return cnt;
	}

	@Override
	public int deleteJjim(MainProdVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("mainProd.deleteJjim", vo);
			if(cnt>0) {
				// 작업이 성공하면 AutoCommit이 비활성화된 상태이기 때문에 직접 commit을 실행해야 한다.
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null ) session.close();
		}
		
		return cnt;
	}

	@Override
	public int selectUserCateCount(MainProdVO vo) {
		
		int res = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			res = session.selectOne("mainProd.selectUserCateCount" ,vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null ) session.close();
		}
		
		return res;
	}

	


	
	

	
	
}
