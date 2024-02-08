package sangchu.category.service;

import java.util.List;

import sangchu.category.vo.CatLargeVO;
import sangchu.category.vo.CatMiddleVO;

public interface ICategoryService {
	/*
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.16 09:23
		수정 내역
		2023.08.16 09:23 - 김석호 : 전달값 없는 파라미터타입 제거
	*/
	
	/**
	 * 메인 카테코리 대분류를 출력하기 위한 메소드
	 * @param vo
	 * @return 대분류 이름
	 */
	public List<CatLargeVO> selectCatLargeList();
	
	
	/**
	 * 카테고리 중분류를 출력하기 위한 메소드
	 * @param mi
	 * @return 중분류 이름
	 */
	public List<CatMiddleVO> selectCatMiddleList ();


}
