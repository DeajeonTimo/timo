package sangchu.login.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import sangchu.category.vo.CatMiddleVO;
import sangchu.main.vo.MemberVO;
import sangchu.qnaBoard.vo.QNABoardVO;

public class LoginDaoImpl implements ILoginDao{
	
	private static LoginDaoImpl dao;
	
	private LoginDaoImpl() {}
	
	public static LoginDaoImpl getInstance() {
		if(dao==null) dao=new LoginDaoImpl();
		return dao;
	}
	
	//	회원가입시, 이메일중복검사
	@Override
	public String checkEmail(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		String userEmail = null;
		
		try{
			userEmail = session.selectOne("member.checkEmail", email); //email 이 없다면 0반환
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		
		return userEmail;
	}

	@Override
	public int insertFristSignup(MemberVO memVo) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.insert("member.insertFristSignup", memVo);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}
	

	@Override
	public String checkACode(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		String acode=null;
		
		try {
			acode = session.selectOne("member.checkACode", email); //acode는 String
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return acode;
	}
	
	//2차 회원가입시, 닉네임 중복검사 
	@Override
	public String checkNickname(String nickname) {
		SqlSession session = MybatisUtil.getSqlSession();
		String userNickname = null;
		
		try{
			userNickname = session.selectOne("member.checkNickname", nickname);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return userNickname;
	}

	@Override
	public MemberVO getAllMemberInfo(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		MemberVO memVO =null;
		
		try{
			memVO = session.selectOne("member.getAllMemberInfo", email); 
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return memVO;
	}

	@Override
	public int updateLoginTry(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res =0;
		try{
			res = session.update("member.updateLoginTry", email);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public int updateTryToZero(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res =0;
		try{
			res = session.update("member.updateTryToZero", email);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public List<CatMiddleVO> getMiCatfromLaCat(String LaCatName) {
		SqlSession session = MybatisUtil.getSqlSession();
		List<CatMiddleVO> list =null;
		try {
			list = session.selectList("member.getMiCatfromLaCat", LaCatName);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return list;
	}

	@Override
	public int insertSecondSighup(MemberVO memVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res =0;
		try {
			System.out.println("이메일 => " + memVO.getEmail());
			res = session.insert("member.insertSecondSighup", memVO);
			System.out.println("여기다오2");
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public int updateA_code(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res =0;
		
		try {
			res = session.update("member.updateA_code", email);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public List<String> findEmail(MemberVO memVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		List<String> emailList = null;

		try {
			emailList = session.selectList("member.findEmail", memVO);
			System.out.println(emailList);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return emailList;
	}

	@Override
	public String findPass(MemberVO memVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		String pass = null;

		try {
			pass = session.selectOne("member.findPass", memVO);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return pass;
	}

	@Override
	public int updateTempPassword(MemberVO memVO) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res = 0;
		try {
			res = session.update("member.updateTempPassword", memVO);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public MemberVO getAllUsersVO(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		MemberVO memberVO = null;
		try {
			memberVO = session.selectOne("member.getAllUsersVO", email);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return memberVO;
	}

	@Override
	public int countAllusers() {
		SqlSession session = MybatisUtil.getSqlSession();
		int res=0;
		try {
			 res = session.selectOne("member.countAllusers");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public int countToday() {
		SqlSession session = MybatisUtil.getSqlSession();
		int res=0;
		try {
			 res = session.selectOne("member.countToday");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public int updatelogindate(String email) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res=0;
		try {
			 res = session.update("member.updatelogindate", email);
			 session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public int countSignupToday() {
		SqlSession session = MybatisUtil.getSqlSession();
		int res=0;
		try {
			 res = session.selectOne("member.countSignupToday");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public int countGender(String u_gender) {
		SqlSession session = MybatisUtil.getSqlSession();
		int res=0;
		try {
			 res = session.selectOne("member.countGender", u_gender);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return res;
	}

	@Override
	public List<QNABoardVO> qnAList() {
		SqlSession session = MybatisUtil.getSqlSession();
		 List<QNABoardVO> list = null;
		 try {
			 list= session.selectList("member.qnAList");
		 }catch (Exception e) {
			 e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	
	
	
	
}
