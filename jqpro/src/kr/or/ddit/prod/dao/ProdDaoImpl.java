package kr.or.ddit.prod.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;
import kr.or.ddit.util.DBUtil3;

public class ProdDaoImpl implements IProdDao {

	//db관련 
	
	private static ProdDaoImpl instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private ProdDaoImpl() {
		
	}
	
	public static ProdDaoImpl getInstance() {
		
		if(instance==null) {
			instance = new ProdDaoImpl();
		}
		return instance;
	}
	
	
	@Override
	public List<ProdVO> selectByLgu(String lprod_gu) {
		List<ProdVO> list = null;
		try {
			list = new ArrayList<ProdVO>();
			conn = DBUtil3.getConnection();
			String sql = "select prod_id,prod_name from prod where prod_lgu=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,lprod_gu);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProdVO ProdVo  = new ProdVO();
				ProdVo.setProd_id(rs.getString("prod_id"));
				ProdVo.setProd_name(rs.getString("prod_name"));
				list.add(ProdVo);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close();}catch(SQLException e) {}
			if(conn!=null) try { conn.close();}catch(SQLException e) {}
		}

		return list;
	}

	@Override
	public ProdVO selectById(String prodId) {
		ProdVO ProdVo  = null;
		try {
			ProdVo  = new ProdVO();
			conn = DBUtil3.getConnection();
			String sql = "select * from prod where prod_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,prodId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ProdVo.setProd_id(rs.getString("prod_id"));
				ProdVo.setProd_name(rs.getString("prod_name"));
				ProdVo.setProd_lgu(rs.getString("prod_lgu"));
				ProdVo.setProd_buyer(rs.getString("prod_buyer"));
				ProdVo.setProd_cost(rs.getInt("prod_cost"));
				ProdVo.setProd_price(rs.getInt("prod_price"));
				ProdVo.setProd_sale(rs.getInt("prod_sale"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try { pstmt.close();}catch(SQLException e) {}
			if(conn!=null) try { conn.close();}catch(SQLException e) {}
		}
		return ProdVo;
	}

}
