package sangchu.adminMode.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.adminMode.vo.EnquiryNUsersVO;
import sangchu.adminMode.vo.EnquiryVO;
import sangchu.main.vo.MemberVO;

public class AdminModeDaoImpl implements IAdminModeDao {

	private static AdminModeDaoImpl dao;

	private AdminModeDaoImpl() {
	}

	public static AdminModeDaoImpl getInstance() {
		if (dao == null)
			dao = new AdminModeDaoImpl();
		return dao;
	}

	@Override
	public MemberVO searchUserEmail(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		MemberVO memVO = null;
		try {
			memVO = session.selectOne("member.searchUserEmail", email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return memVO;
	}

	@Override
	public int updateStopdate(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.update("member.updateStopdate", email);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return res;
	}

	@Override
	public int countUsersHavingStopdate() {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.selectOne("member.getAllStopdate");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return res;
	}

	@Override
	public List<MemberVO> getAllUSeraStopdate() {
		SqlSession session = MybatisUtil.getSqlSession();
		List<MemberVO> list = null;
		try {
			list = session.selectList("member.getAllUSeraStopdate");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	
	@Override
	public int clearStopdateAll() {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.update("member.clearStopdateAll");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return res;
	}
	
	@Override
	public int clearStopdate(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.update("member.clearStopdate");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return res;
	}

	@Override
	public List<EnquiryVO> getAllEnquiry() {
		SqlSession session = MybatisUtil.getSqlSession();
		List<EnquiryVO> list = null;
		try {
			list = session.selectList("member.getAllEnquiry");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	@Override
	public EnquiryVO getEnquiry(String e_no) {
		SqlSession session = MybatisUtil.getSqlSession();
		EnquiryVO enquiryVO = null;
		try {
			enquiryVO = session.selectOne("member.getEnquiry", e_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return enquiryVO;
	}

	@Override
	public int setStopdate(MemberVO memVO) {
		SqlSession session=MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.update("member.setStopdate", memVO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return res;
	}

	@Override
	public EnquiryNUsersVO getStopdateNEnquiry(String e_target) {
		SqlSession session = MybatisUtil.getSqlSession();
		EnquiryNUsersVO euVO = null;
		try {
			euVO = session.selectOne("enquiryNUsersVO.getStopdateNEnquiry", e_target);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return euVO;
	}

	@Override
	public int countTradeLCat(String lCat) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.selectOne("member.countTradeLCat", lCat);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

}
