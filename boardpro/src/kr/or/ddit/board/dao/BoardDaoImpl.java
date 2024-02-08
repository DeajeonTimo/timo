package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.board.vo.PageVO;
import kr.or.ddit.util.MybatisUtil;

public class BoardDaoImpl implements IBoardDao {

	private static BoardDaoImpl instance;
	
	private BoardDaoImpl() { }
	
	public static BoardDaoImpl getInsctance() {
		if(instance==null) instance = new BoardDaoImpl();
		return instance;
	}
	
	@Override
	public List<BoardVO> selctByPage(Map<String, Object> map) {
		List<BoardVO> list = null;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("board.selctByPage", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		int num = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			num = session.insert("board.insertBoard", vo);
			if(num>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return num;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		int num = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			num = session.update("board.updateBoard", vo);
			if(num>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return num;
	}

	@Override
	public int deleteBoard(int num) {
		int num2 = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			num2 = session.delete("board.deleteBoard", num);
			if(num2>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return num2;
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		int num = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			num = session.selectOne("board.getTotalCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return num;
	}

	@Override
	public int updateHit(int num) {
		int num2 = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			num2 = session.update("board.updateHit", num);
			if(num2>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return num2;
	}

	@Override
	public int insertReply(ReplyVO vo) {
		int num = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			num = session.insert("reply.insertReply", vo);
			if(num>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return num;
	}

	@Override
	public int updateReply(ReplyVO vo) {
		int num = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			num = session.update("reply.updateReply", vo);
			if(num>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return num;
	}

	@Override
	public int deleteReply(int num) {
		int res = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			res = session.delete("reply.deleteReply", num);
			if(res>0) {
				session.commit();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return res;
	}

	@Override
	public List<ReplyVO> listReply(int bonum) {
		List<ReplyVO> list = null;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("reply.listReply", bonum);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}

}
