package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public class MemberServiceImpl implements IMeberService {

	private IMemberDao dao;
	private static MemberServiceImpl service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
	}
	
	public static MemberServiceImpl getService() {
		if(service==null) {
			service = new MemberServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<MemberVO> getAllMember() {
		
		return dao.getAllMember();
	}

	@Override
	public String selectById(String memId) {
		
		return dao.selectById(memId);
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		
		return dao.selectByDong(dong);
	}

	@Override
	public int insertMember(MemberVO vo) {
	
		return dao.insertMember(vo);
	}

}
