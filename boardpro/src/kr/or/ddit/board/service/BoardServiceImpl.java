package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.board.vo.PageVO;

public class BoardServiceImpl implements IBoardService {

	private static BoardServiceImpl instance;
	private BoardDaoImpl dao;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInsctance();
	}
	
	public static BoardServiceImpl getInsctance() {
		if(instance==null) instance = new BoardServiceImpl();
		return instance;
	}
	
	
	@Override
	public List<BoardVO> selctByPage(Map<String, Object> map) {
		
		return dao.selctByPage(map);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		
		return dao.insertBoard(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		
		return dao.updateBoard(vo);
	}

	@Override
	public int deleteBoard(int num) {
		
		return dao.deleteBoard(num);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		
		return dao.getTotalCount(map);
	}

	@Override
	public PageVO pageInfo(int pageNo, String stype, String sword) {
		
		//전체 글 갯수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		int count = this.getTotalCount(map);
		
		//전체 페이지수 구하기
		int perList = PageVO.getPerList();
		
		int totalPage = (int)Math.ceil((double)count/perList);
		
		//시작 글번호
		int start = (pageNo -1) * perList + 1;
		int end = start + perList -1;
		if(end>count) end = count;
		
		//시작페이지
		int perPage = PageVO.getPerPage(); 
		int startPage = ((pageNo-1) / perPage * perPage)+1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage ;
		
		PageVO vo = new PageVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
	
		return vo;
	}

	@Override
	public int updateHit(int num) {
		
		return dao.updateHit(num);
	}

	@Override
	public int insertReply(ReplyVO vo) {
		
		return dao.insertReply(vo);
	}

	@Override
	public int updateReply(ReplyVO vo) {
		
		return dao.updateReply(vo);
	}

	@Override
	public int deleteReply(int num) {
		
		return dao.deleteReply(num);
	}

	@Override
	public List<ReplyVO> listReply(int bonum) {
		
		return dao.listReply(bonum);
	}

}
