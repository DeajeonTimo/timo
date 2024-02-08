package sangchu.login.dao;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.login.vo.InterestVO;

public class InterestDaoImpl implements IInterestDao{

	private static InterestDaoImpl dao;
	private InterestDaoImpl() {}
	public static InterestDaoImpl getInstance() {
		if(dao==null) dao=new InterestDaoImpl();
		return dao;
	}
	
	@Override
	public int insertInterest(InterestVO interestVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.insert("member.insertInterest", interestVO);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

}
