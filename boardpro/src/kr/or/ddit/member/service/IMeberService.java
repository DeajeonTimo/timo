package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMeberService {
	//로그인 처리
	public MemberVO logSelect(MemberVO vo);
	
	//전체리스트 가져오기 
	public List<MemberVO>  getAllMember();
	
	//아이디 중복검사
	public String selectById(String memId);
	//우편번호 검색
	public List<ZipVO> selectByDong(String dong);
	
	//전송(가입신청)
	public int insertMember(MemberVO vo);
}
