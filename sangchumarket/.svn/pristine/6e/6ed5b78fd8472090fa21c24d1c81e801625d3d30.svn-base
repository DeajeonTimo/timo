package sangchu.mypage.service;

import java.util.List;

import sangchu.category.vo.CatMiddleVO;
import sangchu.main.vo.MemberVO;
import sangchu.mypage.vo.BlackListVO;
import sangchu.mypage.vo.CatManageVO;
import sangchu.mypage.vo.JjimVO;
import sangchu.mypage.vo.OfferManageVO;
import sangchu.mypage.vo.RegTradeVO;
import sangchu.mypage.vo.ReviewVO;
import sangchu.mypage.vo.TradeLogVO;
import sangchu.mypage.vo.UpdateMemberVO;
import sangchu.mypage.vo.UserKeywordVO;

/*
	최초 작성자 : 김석호 
	최초 작성일 : 2023.08.10 13:37
	
	최근 수정자 : 김석호
	최근 수정일 : 2023.08.20 18:01
		
	수정내역
	2023.08.11 10:53 - 김석호 : 거래게시글 메소드 추가
	2023.08.11 22:57 - 김석호 : 닉네임변경용 메소드 추가
	2023.08.12 00:31 - 김석호 : 닉네임변경 메소드 파라미터 String > MemberVO 변경
	2023.08.12 09:34 - 김석호 : 탈퇴일 처리용 메소드 추가
	2023.08.12 12:56 - 김석호 : 거래기록관련 메소드 추가
	2023.08.13 01:10 - 김석호 : 유저의 판매수,구매수,받은평점관련 메소드 추가
	2023.08.14 21:00 - 김석호 : 비밀번호 변경용 확인 메소드 추가
	2023.08.15 13:06 - 김석호 : 키워드 관리용 메소드 추가
	2023.08.15 15:54 - 김석호 : 키워드 관리용 메소드 추가
	2023.08.16 09:32 - 김석호 : 관심카테고리 관리용 메소드 추가
	2023.08.16 16:09 - 김석호 : 블랙리스트 관련 메소드 추가
	2023.08.20 18:01 - 김석호 : 거래제의관련 메소드 추가
	
	마이 페이지에서 필요한 정보를 처리하기 위한 Service 인터페이스입니다.
*/
public interface IMypageService {
	
	/**
	 * 사용자의 이메일을 매개변수로 받아 해당 유저가 찜한 목록을 가져오는 메소드
	 * @param email 사용자의 이메일
	 * @return 해당 유저가 찜한 JjimVO객체의 List
	 */
	public List<JjimVO> getAllJjimList(String email);
	
	/**
	 * 거래번호로 거래글의 대표이미지 파일명 하나를 얻는 메소드
	 * @param t_no 거래번호
	 * @return 해당 거래번호로 등록된 이미지중 하나의 이미지 파일명
	 */
	public String getOneImgSrc(String t_no);
	
	/**
	 * 이메일로 본인이 등록한 거래글을 List로 받아오는 메소드
	 * @param email 유저의 이메일
	 * @return 유저가 등록한 거래게시글 RegTradeVO객체가 담긴 List객체
	 */
	public List<RegTradeVO> getmyRegList(String email);
	
	/**
	 * 변경하고자 하는 닉네임이 존재하는지 확인하는 메소드
	 * @param targetNickname 변경하려는 닉네임
	 * @return 변경가능 : 0 , 변경불가 : 1
	 */
	public int checkNickname(String targetNickname);
	
	/**
	 * 닉네임 변경 메소드
	 * @param targetNickName 변경하려는 닉네임
	 * @return 변경 성공 : 1, 변경 실패 : 0
	 */
	public int updateNickName(MemberVO memVO);
	
	/**
	 * 마이페이지에서 회원탈퇴 신청을 처리하는 메소드
	 * @param email 회원탈퇴 신청한 유저의 email
	 * @return 성공 : 1, 실패 : 0
	 */
	public int escapeHere(String email);
	
	/**
	 * 이메일로 본인의 거래 기록을 List로 받아오는 메소드
	 * @param email 거래 이력을 확인할 유저의 email
	 * @return 유저가 거래한 이력이 담긴TradeLogVO객체의 List
	 */
	public List<TradeLogVO> forAllTradeLog(String email);
	
	/**
	 * 이메일로 본인의 판매수, 거래수, 평점을 받아오는 메소드
	 * @param email 유저 이메일
	 * @return 거래정보가 담긴 ReviewVO객체
	 */
	public ReviewVO getUserTradeInfo(String email);
	
	/**
	 * 이미지 업데이트를 처리하는 메소드
	 * @param upMemVO 업데이트용 정보가 담긴 VO객체
	 * @return 실패 : 0, 성공 : 1 이상
	 */
	public int updateUserImage(UpdateMemberVO upMemVO);
	
	/**
	 * 회원 정보 수정을 하는 메소드
	 * @param upMemVO 업데이트용 정보가 담긴 VO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int updateMemberInfo(UpdateMemberVO upMemVO);
	
	/**
	 * 비밀번호 변경을 하는 메소드
	 * @param upMemVO 업데이트용 정보가 담긴 VO객체
	 * @return 성공 : 2, 실패 : 2 미만
	 */
	public int updateUserPassword(UpdateMemberVO upMemVO);
	
	/**
	 * 비밀번호 변경을 위해 현재 비밀번호를 확인하는 메소드
	 * @param memVO 이메일, 비밀번호 정보가 담긴 VO
	 * @return 일치 : 1, 불일치 : 0
	 */
	public int checkPassword(MemberVO memVO);
	
	/**
	 * 유저의 관리 키워드 목록을 불러오는 메소드
	 * @param email 유저 email
	 * @return email로 등록된 관리,차단 키워드 UserKeywordVO객체가 담긴 List객체
	 */
	public List<UserKeywordVO> getUserKeyword(String email);
	
	/**
	 * 유저가 등록해 놓은 키워드를 삭제하는 메소드
	 * @param ukeyVO 키워드 정보가 담긴 UserKeywordVO객체
	 * @return 삭제 성공 : 1, 실패 : 0
	 */
	public int deleteUserKeyword(UserKeywordVO ukeyVO);
	
	/**
	 * 유저의 키워드를 등록하는 메소드
	 * @param ukeyVO 키워드 정보가 담긴 UserKeywordVO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertUserKeyword(UserKeywordVO ukeyVO);
	
	/**
	 * 유저의 관심키워드 갯수를 확인하는 메소드
	 * @param email 유저의 email
	 * @return 관심키워드의 갯수
	 */
	public int countInKeyword(String email);
	
	/**
	 * 유저의 차단키워드 갯수를 확인하는 메소드
	 * @param email 유저의 email
	 * @return 차단키워드의 갯수
	 */
	public int countBlKeyword(String email);
	
	/**
	 * 등록하려는 키워드가 이미 등록되어있는지 확인하는 메소드
	 * @param ukeyVO
	 * @return 기등록 : 1, 미등록 : 0
	 */
	public int checkKeyword(UserKeywordVO ukeyVO);
	
	/**
	 * 관심카테고리 하나를 삭제하는 메소드
	 * @param catManVO 삭제할 카테고리 및 유저 정보가 담긴 VO객체
	 * @return 삭제 성공 : 1, 실패 : 0
	 */
	public int delInterCat(CatManageVO catManVO);
	
	/**
	 * 등록하려는 관심카테고리가 이미 등록되어있는지 확인하는 메소드
	 * @param catManVO 등록하려는 카테고리 및 유저정보가 담긴 VO객체
	 * @return 기등록 : 1, 미등록 : 0
	 */
	public int isThereCatAlready(CatManageVO catManVO);
	
	/**
	 * 관심카테고리를 삽입하는 메소드
	 * @param catManVO 등록하려는 카테고리와 유저 정보가 담긴 VO객체
	 * @return 등록 성공 : 1, 실패 : 0
	 */
	public int insertCat(CatManageVO catManVO);
	
	/**
	 * 대분류 코드로 해당하는 중분류 카테고리 List를 얻는 메소드
	 * @param c_largecat 대분류 코드
	 * @return 매개변수로 전달한 대분류 코드에 해당하는 중분류 카테고리정보가 담긴 CatMiddleVO의 List
	 */
	public List<CatMiddleVO> selectMiddlecat(String c_largecat);
	
	/**
	 * 유저의 관심카테고리 갯수를 받아오는 메소드
	 * @param email 유저  email
	 * @return 유저가 등록해놓은 관심카테고리 갯수 0이상 5이하
	 */
	public int countUserCat(String email);
	
	/**
	 * 유저가 등록해놓은 관심카테고리 목록을 가져오는 메소드
	 * @param email 유저 email
	 * @return 유저가 등록해놓은 관심카테고리 정보가 담긴 CatManageVO객체의 List
	 */
	public List<CatManageVO> myCatList(String email);
	
	/**
	 * 유저의 블랙리스트 목록을 가져오는 메소드
	 * @param email 유저의 email
	 * @return 유저의 블랙리스트 정보가담긴 BlackListVO 객체의 List
	 */
	public List<BlackListVO> getMyBlackList(String email);
	
	/**
	 * 유저가 블랙리스트 차단을 해제하는 메소드
	 * @param blackVO 차단해제할 정보가 담긴 BlackListVO 객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int setThemFree(BlackListVO blackVO);
	
	/**
	 * 유저가 작성한 글에 채팅방을 통해 들어온 거래 제의를 받아오는 메소드
	 * @param email 유저의 email
	 * @return 거래 제시정보가 담긴 OfferManageVO객체의 List
	 */
	public List<OfferManageVO> getOfferToMe(String email);
	
	/**
	 * 거래글의 상태를 완료로 바꾸는 쿼리문
	 * @param t_no 거래글 번호
	 * @return 성공 : 1, 실패 : 0
	 */
	public int updateEndTradeState(String t_no);
}