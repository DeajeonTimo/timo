package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;
import kr.or.ddit.util.DBUtil3;
import kr.or.ddit.util.MybatisUtil;

public class MemberDaoImpl implements IMemberDao {

	private static IMemberDao  dao;
	
	
	private MemberDaoImpl() {
		
	}
	
	//db접근 실행 설정 
//	private Connection con = null;
//			//DBUtil3.getConnection();
//	
//	private PreparedStatement  pstmt ;
//	private ResultSet  rs ;
	
	//싱글톤 
	public static IMemberDao getDao() {
		if(dao == null)  dao = new MemberDaoImpl();
		
		return dao;
	}
	
		
	@Override
	public List<MemberVO> getAllMember() {
//		List<MemberVO>  list = new ArrayList<MemberVO>();
//		
//		String sql = "select * from member";
//		
//		try {
//			con = DBUtil3.getConnection();
//			pstmt = con.prepareStatement(sql);
//			
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				MemberVO  vo = new MemberVO();
//				vo.setMem_id(rs.getString("mem_id"));
//				vo.setMem_name(rs.getString("mem_name"));
//				vo.setMem_hp(rs.getString("mem_hp"));
//				
//				list.add(vo);
//			}
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
		
		List<MemberVO>  list = null;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("member.getAllMember");

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}

		return list;

	}


	@Override
	public String selectById(String memId) {
		String str = null;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			str = session.selectOne("member.selectById", memId);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}

		return str;
	}


	@Override
	public List<ZipVO> selectByDong(String dong) {
		List<ZipVO> list = null;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("member.selectByDong", dong);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}

		return list;
	}


	@Override
	public int insertMember(MemberVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("member.insertMember", vo);
			
			if(cnt>0) {
				 session.commit(); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}

		return cnt;
		
	}

}
