package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {

	boolean checkDuplication(String id);
	
	List<MemberVO> serchAddress(String address);
	
	void inputAddress(String id,String ZIP, String address);
	
}
