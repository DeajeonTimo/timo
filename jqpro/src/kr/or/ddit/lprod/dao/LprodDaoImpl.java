package kr.or.ddit.lprod.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.lprod.vo.LprodVO;
import kr.or.ddit.util.DBUtil3;

public class LprodDaoImpl implements ILprodDao {

	private static LprodDaoImpl instance;
	
	private LprodDaoImpl() {
		
	}
	
	public static LprodDaoImpl getInstance() {
		if(instance==null) {
			instance = new LprodDaoImpl();
		}
		return instance;
	}
	
	
	@Override
	public List<LprodVO> selctLprod() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<LprodVO> lprodList = null;
		try {
			conn = DBUtil3.getConnection();
			String sql = "select * from lprod";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			lprodList = new ArrayList<LprodVO>();
			while(rs.next()) {
				LprodVO lprodVo = new LprodVO();
				lprodVo.setLprod_id(rs.getInt("lprod_id"));
				lprodVo.setLprod_gu(rs.getString("lprod_gu"));
				lprodVo.setLprod_nm(rs.getString("lprod_nm"));
				lprodList.add(lprodVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try { conn.close();} catch(SQLException e) {}
		}
		return lprodList;
	}

}
