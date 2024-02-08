package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public class MemberDaolmpl implements IMemberDao  {
	
	private static MemberDaolmpl instance = null;

	private MemberDaolmpl() {
	}

	public static MemberDaolmpl getInstance() {
		if (instance == null) {
			instance = new MemberDaolmpl();
		}
		return instance;
	}

	@Override
	public boolean checkDuplication(String id) {
	
		return false;
	}

	@Override
	public List<MemberVO> serchAddress(String address) {
		
		return null;
	}

	@Override
	public void inputAddress(String id, String ZIP, String address) {
		
		
	}
}
