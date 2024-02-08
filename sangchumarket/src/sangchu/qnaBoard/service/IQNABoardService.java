package sangchu.qnaBoard.service;

import java.util.List;

import sangchu.main.vo.PageVO;
import sangchu.qnaBoard.vo.QNABoardVO;

public interface IQNABoardService {
	
	public int insertQNABoard (QNABoardVO vo);
	
	public List<QNABoardVO> qnaBoardList (QNABoardVO vo);
	
	public PageVO pageInfo (QNABoardVO vo);
	
	public int qnaBoardListCounting (QNABoardVO vo);

	public int deleteQNABoard (QNABoardVO vo);

	public int updateQNABoard(QNABoardVO vo);
	
	public QNABoardVO selectQnaInfo(String cm_no);

	public List<QNABoardVO> qnaBoardManageList(QNABoardVO vo);

	public int insertReply(QNABoardVO vo);
	
	public PageVO AdminpageInfo (QNABoardVO vo);
	
}
