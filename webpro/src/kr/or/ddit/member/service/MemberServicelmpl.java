package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.MemberDaolmpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServicelmpl implements IMemberService {
	private static MemberServicelmpl instance = null;

	private MemberServicelmpl() {
	}

	public static MemberServicelmpl getInstance() {
		if (instance == null) {
			instance = new MemberServicelmpl();
		}
		return instance;
	}
	
	MemberDaolmpl dao = MemberDaolmpl.getInstance();

	@Override
	public boolean checkDuplication(String id) {
		
		return dao.checkDuplication(id);
	}

	@Override
	public List<MemberVO> serchAddress(String address) {
		
		return dao.serchAddress(address);
		
	}

	@Override
	public void inputAddress(String id , String ZIP, String address) {
		
		dao.inputAddress(id,ZIP, address);
		
	}
	
	
}
