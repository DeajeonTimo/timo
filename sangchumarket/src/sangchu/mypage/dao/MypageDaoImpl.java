package sangchu.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.category.vo.CatMiddleVO;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.vo.BlackListVO;
import sangchu.mypage.vo.CatManageVO;
import sangchu.mypage.vo.JjimVO;
import sangchu.mypage.vo.OfferManageVO;
import sangchu.mypage.vo.RegTradeVO;
import sangchu.mypage.vo.TradeLogVO;
import sangchu.mypage.vo.UpdateMemberVO;
import sangchu.mypage.vo.UserKeywordVO;

public class MypageDaoImpl implements IMypageDao {
	private static IMypageDao dao;
	private MypageDaoImpl() {}
	public static synchronized IMypageDao getInstance() {
		if(dao==null) dao = new MypageDaoImpl();
		return dao;
	}
	
	/*
		최초 작성자 : 김석호 
		최초 작성일 : 2023.08.10 13:37
			
		최근 수정자 : 김석호
		최근 수정일 : 2023.08.20 18:08
		
		수정 내역
		2023.08.11 11:16 - 김석호 : 신규 메소드 세션 미생성 부분 수정
		2023.08.11 22:57 - 김석호 : 닉네임변경용 메소드 추가
		2023.08.12 00:31 - 김석호 : 닉네임변경 메소드 파라미터 String > MemberVO 변경
		2023.08.12 09:34 - 김석호 : 탈퇴일 처리용 메소드 추가
		2023.08.12 12:56 - 김석호 : 거래기록관련 메소드 추가
		2023.08.13 01:13 - 김석호 : 거래수 및 평점관련 메소드 추가
		2023.08.14 16:41 - 김석호 : 회원정보 업데이트 관련 메소드
		2023.08.14 21:00 - 김석호 : 비밀번호 변경용 확인 메소드 추가
		2023.08.15 13:06 - 김석호 : 키워드 관리용 메소드 추가
		2023.08.15 15:57 - 김석호 : 키워드 관리용 메소드 추가
		2023.08.16 09:32 - 김석호 : 관심카테고리 관리용 메소드 추가
		2023.08.16 16:09 - 김석호 : 블랙리스트 관련 메소드 추가
		2023.08.20 18:08 - 김석호 : 거래제의관련 메소드 추가
		
		마이 페이지에서 필요한 정보를 처리하기 위한 Dao객체입니다.
	*/
	
	@Override
	public List<JjimVO> getAllJjimList(String email) {
		List<JjimVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.getAllJjimList", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getAllJjimList메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public synchronized String getOneImgSrc(String t_no) {
		String src = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			src = session.selectOne("mypage.getOneImgSrc", t_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getOneImgSrc메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return src;
	}

	@Override
	public List<RegTradeVO> getmyRegList(String email) {
		List<RegTradeVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.getmyRegList", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getmyRegList메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int checkNickname(String targetNickname) {
		int res = 1;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.checkNickname", targetNickname);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkNickname메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int updateNickName(MemberVO memVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.update("mypage.updateNickName", memVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateNickName메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int escapeHere(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.update("mypage.escapeHere", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("escapeHere메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public List<TradeLogVO> forAllTradeLog(String email) {
		List<TradeLogVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.forAllTradeLog", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("forAllTradeLog메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int cntSell(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.cntSell", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cntSell메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int cntBuy(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.cntBuy", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cntBuy메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public List<Integer> takenSangchu(String email) {
		List<Integer> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.takenSangchu", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("takenSangchu메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public List<Integer> givenSangchu(String email) {
		List<Integer> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.givenSangchu", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("givenSangchu메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		
		return list;
	}

	@Override
	public int checkIsThereImage(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.checkIsThereImage", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkIsThereImage메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int clearImageForUpdate(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.delete("mypage.clearImageForUpdate", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("clearImageForUpdate메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int updateInsertImage(UpdateMemberVO upMemVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.update("mypage.updateInsertImage", upMemVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateInsertImage메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int updateMemberInfo(UpdateMemberVO upMemVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.update("mypage.updateMemberInfo", upMemVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateMemberInfo메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int updatePassword(UpdateMemberVO upMemVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.update("mypage.updatePassword", upMemVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updatePassword메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int updatePassdate(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.update("mypage.updatePassdate", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updatePassdate메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int checkPassword(MemberVO memVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.checkPassword", memVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkPassword메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public List<UserKeywordVO> getUserKeyword(String email) {
		List<UserKeywordVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.getUserKeyword", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getUserKeyword메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int deleteUserKeyword(UserKeywordVO ukeyVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.delete("mypage.deleteUserKeyword", ukeyVO);
			System.out.println("deleteUserKeyword메소드 처리결과 레코드 수 :"+res);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteUserKeyword메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int insertUserKeyword(UserKeywordVO ukeyVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.insert("mypage.insertUserKeyword", ukeyVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertUserKeyword메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int countInKeyword(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.countInKeyword", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("countInKeyword메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int countBlKeyword(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.countBlKeyword", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("countBlKeyword메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int checkKeyword(UserKeywordVO ukeyVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.checkKeyword", ukeyVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkKeyword메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int delInterCat(CatManageVO catManVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.delete("mypage.delInterCat", catManVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delInterCat메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int isThereCatAlready(CatManageVO catManVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.isThereCatAlready", catManVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isThereCatAlready메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public int insertCat(CatManageVO catManVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.insert("mypage.insertCat", catManVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertCat메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public List<CatMiddleVO> selectMiddlecat(String c_largecat) {
		List<CatMiddleVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.selectMiddlecat", c_largecat);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectMiddlecat메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	@Override
	public int countUserCat(String email) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.selectOne("mypage.countUserCat", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("countUserCat메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}
	@Override
	public List<CatManageVO> myCatList(String email) {
		List<CatManageVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.myCatList", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("myCatList메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public List<BlackListVO> getMyBlackList(String email) {
		List<BlackListVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.getMyBlackList", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMyBlackList메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int setThemFree(BlackListVO blackVO) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.delete("mypage.setThemFree", blackVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("setThemFree메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}
	@Override
	public List<OfferManageVO> getOfferToMe(String email) {
		List<OfferManageVO> list = null;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			list = session.selectList("mypage.getOfferToMe", email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getOfferToMe메소드에서 오류");
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	@Override
	public int updateEndTradeState(String t_no) {
		int res = 0;
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			res = session.update("mypage.updateEndTradeState", t_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateEndTradeState메소드에서 오류");
		}finally {
			if(res>0) session.commit();
			if(session!=null) session.close();
		}
		return res;
	}
}
