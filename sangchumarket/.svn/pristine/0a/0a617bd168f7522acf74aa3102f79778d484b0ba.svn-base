package sangchu.tboard.service;

import java.util.List;

import sangchu.adminMode.vo.EnquiryVO;
import sangchu.category.vo.CatMiddleVO;
import sangchu.main.vo.MainProdVO;
import sangchu.main.vo.PageVO;
import sangchu.tboard.dao.ITBoardDao;
import sangchu.tboard.dao.TBoardDaoImpl;
import sangchu.tboard.vo.TBoardVO;
import sangchu.trade.vo.TradeVO;
import sangchu.uView.vo.UViewVO;

public class TBoardServiceImpl implements ITBoardService {

	private ITBoardDao dao;
	
	private static ITBoardService service;
	
	private TBoardServiceImpl() {
		dao=TBoardDaoImpl.getInstance();
	}
	
	public static ITBoardService getInstance() {
		if(service==null)service=new TBoardServiceImpl();
		return service;
	}
	
	@Override
	public List<TBoardVO> selectTBoard(String mid) {
		return dao.selectTBoard(mid);
	}

	@Override
	public TBoardVO selectTBoardOne(String tid) {
		return dao.selectTBoardOne(tid);
	}

	@Override
	public TradeVO selectTradeOne(String tid) {
		return dao.selectTradeOne(tid);
	}

	@Override
	public List<String> tImage(String tid) {
		return dao.tImage(tid);
	}

	@Override
	public int addUView(UViewVO uvo) {
		return dao.addUView(uvo);
	}

	@Override
	public int tImageInsert(TBoardVO tvo) {
		return dao.tImageInsert(tvo);
	}

	@Override
	public int addTrade(TradeVO tvo) {
		return dao.addTrade(tvo);
	}

	@Override
	public int addTBorad(TBoardVO tbvo) {
		return dao.addTBorad(tbvo);
	}

	@Override
	public List<CatMiddleVO> selectCatMiddleOne(String lCategory) {
		return dao.selectCatMiddleOne(lCategory);
	}

	@Override
	public int upCnt(String tid) {
		return dao.upCnt(tid);
	}

	@Override
	public int checkJJim(String tid) {
		return dao.checkJJim(tid);
	}

	@Override
	public List<TradeVO> selectTrade(String mid) {
		return dao.selectTrade(mid);
	}

	@Override
	public String selectMiddleName(String mid) {
		return dao.selectMiddleName(mid);
	}

	@Override
	public String selectMaxTNo() {
		return dao.selectMaxTNo();
	}

	@Override
	public String getUNick(String email) {
		return dao.getUNick(email);
	}

	@Override
	public int addEnquiry(EnquiryVO vo) {
		return dao.addEnquiry(vo);
	}

	@Override
	public String tImageOne(String tid) {
		return dao.tImageOne(tid);
	}

	@Override
	public List<MainProdVO> hotItem(MainProdVO vo) {
		return dao.hotItem(vo);
	}

	

	
}
