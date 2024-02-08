package sangchu.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.category.vo.CatLargeVO;
import sangchu.category.vo.CatMiddleVO;
import sangchu.tboard.dao.ITBoardDao;
import sangchu.tboard.dao.TBoardDaoImpl;

public class CategoryDaoImpl  implements ICategoryDao{
	
	SqlSession sql;
	
	private static ICategoryDao dao;
	
	public static ICategoryDao getDao() {
		if(dao == null) dao = new CategoryDaoImpl();
		
		return dao;
 	}
	
	
	@Override
	public List<CatLargeVO> selectCatLargeList() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<CatLargeVO> list = null;
		
		try{
			list = session.selectList("category.selectCatLargeList");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		
		return list;
	}

	@Override
	public List<CatMiddleVO> selectCatMiddleList() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<CatMiddleVO> list = null;
		
		try{
			list = session.selectList("category.selectCatMiddleList");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		
		return list;
	}

}
