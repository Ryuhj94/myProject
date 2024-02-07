package com.MountainCommunity.biz.board.imple;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MountainCommunity.biz.board.BoardVO;

@Repository
public class BoardDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
		
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis로 insertBoard() 기능 처리");
			mybatis.insert("BoardDAO.BoardInsertBoard", vo);
	}

	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> Mybatis로 getBoardList() 기능 처리");
			return mybatis.selectList("BoardDAO.board_getBoardList", vo);
	}
	public int getBoardListCount(BoardVO vo) {
		System.out.println("===> Mybatis로 getBoardListCount() 기능 처리");
			return mybatis.selectOne("BoardDAO.board_getBoardCount", vo);
			}

	public String board_list_sizeDo(BoardVO vo) {
		System.out.println("===> Mybatis로 board_list_sizeDo() 기능 처리");
		List<BoardVO> list;
			list= mybatis.selectList("BoardDAO.getBoardList",vo);
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		for(int i=0; i<list.size(); i++) {
			BoardVO dto=list.get(i);
			 result.append("{\"seq\":\"" + dto.getSeq() + "\",");
			    result.append("\"title\":\"" + dto.getTitle() + "\",");
			    result.append("\"id\":\"" + dto.getId() + "\",");
			    result.append("\"write_date\":\"" + dto.getWrite_date() + "\",");
			    result.append("\"hit\":\"" + dto.getHit() + "\",");
			    result.append("\"views\":\"" + dto.getViews() + "\"}");
			    if (i != list.size() - 1) { result.append(",");}
			
		}
		result.append("]}");
		return result.toString();
	}

	public BoardVO getBoard(BoardVO vo) {
			return mybatis.selectOne("BoardDAO.board_getBoard", vo);
	}

	public void increaseViewsBoard(BoardVO vo) {
			mybatis.selectOne("BoardDAO.board_increaseViews", vo);
	}

	public void DecreaseBoardHit(BoardVO boardvo) {
		mybatis.update("BoardDAO.board_DecreaseBoardHit",boardvo);
	}

	public void IncreaseBoardHit(BoardVO boardvo) {
		mybatis.update("BoardDAO.board_IncreaseBoardHit",boardvo);
	}

	public void modifyBoard(BoardVO vo) {
		mybatis.update("BoardDAO.modifyBoard",vo);
		
	}

	public void boardDelete(BoardVO vo) {
		mybatis.delete("BoardDAO.boardDelete",vo);
		
	}

	public void deletBoard_report(BoardVO boardvo) {
		mybatis.delete("BoardDAO.deletBoard_report",boardvo);
		
	}

	public List<BoardVO> getFreeBoardList() {
		return mybatis.selectList("BoardDAO.getFreeBoardList");
	}

	public List<BoardVO> getNotice_board() {
		return mybatis.selectList("BoardDAO.getNotice_board");
	}

	public List<BoardVO> getGathering_board() {
		return mybatis.selectList("BoardDAO.getGathering_board");
	}
}
