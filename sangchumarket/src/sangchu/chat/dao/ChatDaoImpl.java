package sangchu.chat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.chat.vo.ChatDetailVO;
import sangchu.chat.vo.ChatVO;
import sangchu.chat.vo.ForTradeLogVO;
import sangchu.chat.vo.OfferVO;
import sangchu.chat.vo.TBoardOfferVO;
import sangchu.mypage.vo.TradeLogVO;
import sangchu.tboard.vo.TBoardVO;

public class ChatDaoImpl implements IChatDao {
	private static IChatDao dao;
	private ChatDaoImpl() {}
	
	/*
		최초 작성자 : 김석호
		최초 작성일 : 2023.08.07 13:22
		
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.17 10:31
		
		수정내역
		2023.08.10 01:30 - 김석호 : 이미지파일명 가져오는 메소드 추가
		2023.08.17 10:31 - 김석호 : 새로운 채팅방 개설 관련 메소드 추가
		2023.08.20 13:20 - 김석호 : SQL세션관련 오류..정리
	*/
	
	public synchronized static IChatDao getInstance() {
		if(dao==null) dao = new ChatDaoImpl();
		return dao;
	}
	
	@Override
	public ChatVO getChatVO(String c_no) {
		ChatVO vo = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			vo = sqlSession.selectOne("chat.getChatVO", c_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return vo;
	}

	@Override
	public List<ChatVO> getAllChatList(String email) {
		List<ChatVO> list = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			list = sqlSession.selectList("chat.getAllChatList", email);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return list;
	}

	@Override
	public List<ChatDetailVO> getChatLog(String c_no) {
		List<ChatDetailVO> list = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			list = sqlSession.selectList("chat.getChatLog", c_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return list;
	}

	@Override
	public int insertChatLog(ChatDetailVO vo) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.insert("chat.insertChatLog", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public int insertNewChat(String t_no) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.insert("chat.insertNewChat", t_no);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public String emailImage(String email) {
		String img = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			img = sqlSession.selectOne("chat.emailImage", email);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return img;
	}

	@Override
	public String whoRegThis(String t_no) {
		String result = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			result = sqlSession.selectOne("chat.whoRegThis", t_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("whoRegThis메소드에서 오류");
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return result;
	}

	@Override
	public int isThereAlreadyChatRoom(ChatVO chatVO) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.selectOne("chat.isThereAlreadyChatRoom", chatVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isThereAlreadyChatRoom메소드에서 오류");
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public int createNewChatRoom(ChatVO chatVO) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.insert("chat.createNewChatRoom", chatVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("createNewChatRoom메소드에서 오류");
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public OfferVO getOffer(String c_no) {
		OfferVO vo = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			vo = sqlSession.selectOne("chat.getOffer", c_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getOffer메소드에서 오류");
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return vo;
	}

	@Override
	public int tradeOffer(OfferVO offerVO) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.insert("chat.tradeOffer", offerVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("tradeOffer메소드에서 오류");
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public int regTradeLog(ForTradeLogVO ftLogVO) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.insert("chat.regTradeLog", ftLogVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("regTradeLog메소드에서 오류");
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public int afterTrade(TradeLogVO tradeLogVO) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.insert("chat.afterTrade", tradeLogVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("afterTrade메소드에서 오류");
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public int endTrade(String c_no) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.insert("chat.endTrade", c_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("endTrade메소드에서 오류");
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public int denyOffer(String c_no) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.delete("chat.denyOffer", c_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("denyOffer메소드에서 오류");
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public int breakTrade(String c_no) {
		int res = 0;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			res = sqlSession.delete("chat.breakTrade", c_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("breakTrade메소드에서 오류");
		}finally {
			if(res>0) sqlSession.commit();
			if(sqlSession!=null) sqlSession.close();
		}
		return res;
	}

	@Override
	public String whoRegByCNO(String c_no) {
		String email = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			email = sqlSession.selectOne("chat.whoRegByCNO", c_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("whoRegByCNO메소드에서 오류");
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return email;
	}

	@Override
	public TBoardOfferVO getTBoardInfoByCNO(String c_no) {
		TBoardOfferVO tVO = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			tVO = sqlSession.selectOne("chat.getTBoardInfoByCNO", c_no);
			System.out.println(tVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getTBoardInfoByCNO메소드에서 오류");
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return tVO;
	}

	@Override
	public String getTNOByCNO(String c_no) {
		String tno = null;
		SqlSession sqlSession = MybatisUtil.getSqlSession();
		try {
			tno = sqlSession.selectOne("chat.getTNOByCNO", c_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getTNOByCNO메소드에서 오류");
		}finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return tno;
	}
	
}