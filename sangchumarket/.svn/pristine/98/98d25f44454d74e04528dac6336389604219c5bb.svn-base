package sangchu.qnaBoard.dao;

import java.util.List;

import sangchu.qnaBoard.vo.QNABoardVO;

public interface IQNABoardDao {
	
	/**
	 * 1:1문의글 등록
	 * @param vo
	 * @return
	 */
	public int insertQNABoard (QNABoardVO vo);

	/**
	 * 문의글페이징
	 * @param vo
	 * @return
	 */
	public List<QNABoardVO> qnaBoardList (QNABoardVO vo);
	
	
	/**
	 * 문의글 갯수구하기
	 * @param vo
	 * @return
	 */
	public int qnaBoardListCounting (QNABoardVO vo);
	
	
	/**
	 * 1:1 문의글 삭제, 답글도 같이 삭제
	 * @param vo
	 * @return
	 */
	public int deleteQNABoard (QNABoardVO vo);
	
	
	/**
	 * 1:1문의글 수정
	 * @param vo
	 * @return
	 */
	public int updateQNABoard(QNABoardVO vo);
	
	
	/**
	 * 문의글 가져오기
	 * @param vo
	 * @return
	 */
	public QNABoardVO selectQnaInfo(String cm_no);

	/**
	 * 1:1문의게시판 관리자모드
	 * @param vo
	 * @return
	 */
	public List<QNABoardVO> qnaBoardManageList(QNABoardVO vo);

	/**
	 * 1:1문의게시판 관리자 답변 등록
	 * @param vo
	 * @return
	 */
	public int insertReply(QNABoardVO vo);

	public int AdminqnaBoardListCounting(QNABoardVO vo);
	
	

}