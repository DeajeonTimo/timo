package sangchu.main.dao;

import java.util.List;

import sangchu.main.vo.MainProdVO;
import sangchu.tboard.vo.TBoardVO;

public interface IMainDao {
	
	/**
	 * 조회수와 찜목록 기반으로 뿌려주는 인기상품
	 * @param vo
	 * @return
	 */
	public List<MainProdVO> hotItemRank(MainProdVO vo);	
	

	/**
	 * 최근 등록된 상품 조회하는 메소드 
	 * @return 최근등록상품순으로 정렬된 list
	 * 작성자 : 김보영
	 */
	public List<MainProdVO> recentProd (MainProdVO vo);
	
	
	/**
	 * 메인에서 관심카테고리 변경을 위한 메소드
	 * 1단계 관심카테고리 삭제
	 * @param vo
	 * @return
	 */
	public int deleteInterest (MainProdVO vo);
	
	
	
	/**
	 * 메인에서 관심카테고리 변경을 위한 메소드 
	 * 2단계 관심카페고리 입력
	 * @param vo
	 * @return
	 */
	public int insertInterest(MainProdVO vo);
	
	
	/**
	 * 메인에서 회원이 설정한 카테고리 상품만 보여주는 메소드
	 * @param vo
	 * @return
	 */
	public List<MainProdVO> selectUserCate (MainProdVO vo);
	
	/**
	 * 최근본 상품  최대 3개 까지 출력하는 메소드
	 * @param vo
	 * @return
	 */
	public List<MainProdVO> recentView (MainProdVO vo);
	
	
	/**
	 * 찜목록 추가
	 * @param vo
	 * @return
	 */
	public int insertJjim (MainProdVO vo);
	
	
	/**
	 * 찜 삭제
	 * @param vo
	 * @return
	 */
	public int deleteJjim (MainProdVO vo);


	/**
	 * 관심카테고리 글 갯수를 구하기
	 * @param vo
	 * @return
	 */
	public int selectUserCateCount(MainProdVO vo);
	
	
}
