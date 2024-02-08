package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberDao {

	//전체리스트 가져오기 
	public List<MemberVO>  getAllMember();
	
	//아이디 중복검사
	public String selectById(String memId);
	//우편번호 검색
	public List<ZipVO> selectByDong(String dong);
	
	//전송(가입신청)
	public int insertMember(MemberVO vo);
}
