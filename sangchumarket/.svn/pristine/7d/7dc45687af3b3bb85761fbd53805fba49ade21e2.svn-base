package sangchu.mypage.service;
/*
	최초 작성자 : 김석호 
	최초 작성일 : 2023.08.10 13:52
	
		
	최근 수정자 : 김석호
	최근 수정일 : 2023.08.20 18:08
	
	수정내역
	2023.08.11 22:57 - 김석호 : 닉네임변경용 메소드 추가
	2023.08.12 00:31 - 김석호 : 닉네임변경 메소드 파라미터 String > MemberVO 변경
	2023.08.12 09:34 - 김석호 : 탈퇴일 처리용 메소드 추가
	2023.08.12 12:56 - 김석호 : 거래기록관련 메소드 추가
	2023.08.13 01:10 - 김석호 : 유저의 판매수,구매수,받은평점관련 메소드 추가
	2023.08.14 16:47 - 김석호 : 회원정보 수정 관련 메소드 추가
	2023.08.14 21:00 - 김석호 : 비밀번호 변경용 확인 메소드 추가
	2023.08.15 13:06 - 김석호 : 키워드 관리용 메소드 추가
	2023.08.15 15:57 - 김석호 : 키워드 관리용 메소드 추가
	2023.08.16 09:32 - 김석호 : 관심카테고리 관리용 메소드 추가
	2023.08.16 16:09 - 김석호 : 블랙리스트 관련 메소드 추가
	2023.08.20 18:08 - 김석호 : 거래제의관련 메소드 추가
	
	마이 페이지에서 필요한 정보를 처리하기 위한 Service 객체입니다.
*/

import java.util.List;

import sangchu.category.vo.CatMiddleVO;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.dao.IMypageDao;
import sangchu.mypage.dao.MypageDaoImpl;
import sangchu.mypage.vo.BlackListVO;
import sangchu.mypage.vo.CatManageVO;
import sangchu.mypage.vo.JjimVO;
import sangchu.mypage.vo.OfferManageVO;
import sangchu.mypage.vo.RegTradeVO;
import sangchu.mypage.vo.ReviewVO;
import sangchu.mypage.vo.TradeLogVO;
import sangchu.mypage.vo.UpdateMemberVO;
import sangchu.mypage.vo.UserKeywordVO;

public class MypageServiceImpl implements IMypageService{
	
	private static IMypageService service;
	private IMypageDao dao;
	private MypageServiceImpl() {
		dao = MypageDaoImpl.getInstance();
	}
	public static synchronized IMypageService getInstance() {
		if(service==null)service = new MypageServiceImpl();
		return service;
	}
	
	@Override
	public List<JjimVO> getAllJjimList(String email) {
		return dao.getAllJjimList(email);
	}
	@Override
	public String getOneImgSrc(String t_no) {
		return dao.getOneImgSrc(t_no);
	}
	@Override
	public List<RegTradeVO> getmyRegList(String email) {
		return dao.getmyRegList(email);
	}
	@Override
	public int checkNickname(String targetNickname) {
		return dao.checkNickname(targetNickname);
	}
	@Override
	public int updateNickName(MemberVO memVO) {
		return dao.updateNickName(memVO);
	}
	@Override
	public int escapeHere(String email) {
		return dao.escapeHere(email);
	}
	@Override
	public List<TradeLogVO> forAllTradeLog(String email) {
		return dao.forAllTradeLog(email);
	}
	@Override
	public ReviewVO getUserTradeInfo(String email) {
		ReviewVO vo = new ReviewVO();
		// 구매수 가져와서 세팅
		vo.setBuy_cnt(dao.cntBuy(email));
		// 판매수 가져와서 세팅
		vo.setSell_cnt(dao.cntSell(email));
		// List 두번 받을 객체 하나 생성
		List<Integer> list =null;
		// List안에 점수 풀어헤쳐서 받을 변수 하나 생성
		int score = 0;
		// 점수를 List사이즈로 나눠서 저장할 double 변수 생성
		double finalScore = 0.0;
		// list의 사이즈를 쌓아놓을 변수 생성
		int size = 0;
		list = dao.givenSangchu(email);
		if(list!=null&&list.size()>0) {
			for(int cnt : list) {
				score += cnt;
			}
			size += list.size();
		}
		list = null;
		list = dao.takenSangchu(email);
		if(list!=null&&list.size()>0) {
			for(int cnt : list) {
				score += cnt;
			}
			size += list.size();
		}
		if(size==0) size=1;
		finalScore = 1.0 * score / size;
		vo.setScore(finalScore);
		System.out.println(finalScore);
		return vo;
	}
	@Override
	public int updateUserImage(UpdateMemberVO upMemVO) {
		// 처리과정
		int res = 0;
		String email = upMemVO.getEmail();
		// 1. 이미지가 있는지 먼저 판단
		res = dao.checkIsThereImage(email);
		// 1-1 이미지가 있다면 이미지 레코드 먼저삭제
		if(res>0) {
			res += dao.clearImageForUpdate(email);
		}
		// 2. 업로드한 이미지가 있는지 판단
		String src = upMemVO.getImg_src();
		if(src!=null&&!src.equals("")) {
			// 2-1 업로드한 이미지가 있다면 이미지 다시 업로드
			res+= dao.updateInsertImage(upMemVO);
		}
		return res;
	}
	@Override
	public int updateMemberInfo(UpdateMemberVO upMemVO) {
		return dao.updateMemberInfo(upMemVO);
	}
	@Override
	public int updateUserPassword(UpdateMemberVO upMemVO) {
		int res = dao.updatePassword(upMemVO);
		res += dao.updatePassdate(upMemVO.getEmail());
		return res;
	}
	@Override
	public int checkPassword(MemberVO memVO) {
		return dao.checkPassword(memVO);
	}
	@Override
	public List<UserKeywordVO> getUserKeyword(String email) {
		return dao.getUserKeyword(email);
	}
	@Override
	public int deleteUserKeyword(UserKeywordVO ukeyVO) {
		return dao.deleteUserKeyword(ukeyVO);
	}
	@Override
	public int insertUserKeyword(UserKeywordVO ukeyVO) {
		return dao.insertUserKeyword(ukeyVO);
	}
	@Override
	public int countInKeyword(String email) {
		return dao.countInKeyword(email);
	}
	@Override
	public int countBlKeyword(String email) {
		return dao.countBlKeyword(email);
	}
	@Override
	public int checkKeyword(UserKeywordVO ukeyVO) {
		return dao.checkKeyword(ukeyVO);
	}
	@Override
	public int delInterCat(CatManageVO catManVO) {
		return dao.delInterCat(catManVO);
	}
	@Override
	public int isThereCatAlready(CatManageVO catManVO) {
		return dao.isThereCatAlready(catManVO);
	}
	@Override
	public int insertCat(CatManageVO catManVO) {
		return dao.insertCat(catManVO);
	}
	@Override
	public List<CatMiddleVO> selectMiddlecat(String c_largecat) {
		return dao.selectMiddlecat(c_largecat);
	}
	@Override
	public int countUserCat(String email) {
		return dao.countUserCat(email);
	}
	@Override
	public List<CatManageVO> myCatList(String email) {
		return dao.myCatList(email);
	}
	@Override
	public List<BlackListVO> getMyBlackList(String email) {
		return dao.getMyBlackList(email);
	}
	@Override
	public int setThemFree(BlackListVO blackVO) {
		return dao.setThemFree(blackVO);
	}
	@Override
	public List<OfferManageVO> getOfferToMe(String email) {
		return dao.getOfferToMe(email);
	}
	@Override
	public int updateEndTradeState(String t_no) {
		return dao.updateEndTradeState(t_no);
	}
}