package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {

	boolean checkDuplication(String id);
	
	List<MemberVO> serchAddress(String address);
	
	void inputAddress(String id,String ZIP, String address);
}
