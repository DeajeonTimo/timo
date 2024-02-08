package sangchu.category.service;

import java.util.List;

import sangchu.category.dao.CategoryDaoImpl;
import sangchu.category.dao.ICategoryDao;
import sangchu.category.vo.CatLargeVO;
import sangchu.category.vo.CatMiddleVO;

public class CategoryServiceImpl implements ICategoryService {
	/*
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.16 09:23
		수정 내역
		2023.08.16 09:23 - 김석호 : 전달값 없는 파라미터타입 제거
	*/
	
	
	private ICategoryDao dao;
	private static ICategoryService service;

	private CategoryServiceImpl() {
		dao = CategoryDaoImpl.getDao();
	}
	
	public static ICategoryService getService() {
		if( service == null) service = new CategoryServiceImpl();
		return service;
	}
	
	
	
	@Override
	public List<CatLargeVO> selectCatLargeList() {
		// TODO Auto-generated method stub
		return dao.selectCatLargeList();
	}

	@Override
	public List<CatMiddleVO> selectCatMiddleList() {
		// TODO Auto-generated method stub
		return dao.selectCatMiddleList();
	}

}
