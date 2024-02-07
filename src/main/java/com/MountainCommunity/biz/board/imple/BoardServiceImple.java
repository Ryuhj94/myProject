package com.MountainCommunity.biz.board.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MountainCommunity.biz.board.BoardVO;

@Service("boardService")
public class BoardServiceImple implements BoardService{
	@Autowired
	private BoardDAOMybatis boardDAO;

	//이름바꿔주기
	@Override 
	public String changBoardClassNameKR(String board_class) {
		if(board_class.equals("notice_board")) {board_class="공지 게시판";}
		else if(board_class.equals("free_board")) {board_class="자유 게시판";}
		else if(board_class.equals("gathering_board")) {board_class="소모임 게시판";}
		return board_class;
	}

	@Override
	public void insertBoard(BoardVO vo) {
		System.out.println("BoardServiceImple에서 insertBoard 처리");
		vo.setContent(vo.getContent().replaceAll("\"", "'")); //썸머노트 <img src="~~~">등 을 ""을 '로 바꿔주는작업 
		System.out.println(vo.getContent());
		boardDAO.insertBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("BoardServiceImple에서 insertBoard 처리");
		return boardDAO.getBoardList(vo);
	}

	@Override
	public int getBoardCount(BoardVO vo) {
		System.out.println("BoardServiceImple에서 getBoardCount 처리");
		return boardDAO.getBoardListCount(vo);
	}

	@Override
	public String board_list_sizeDo(BoardVO vo) {
		return boardDAO.board_list_sizeDo(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public void increaseViewsBoard(BoardVO vo) {
		 boardDAO.increaseViewsBoard(vo);
	}

	@Override
	public void DecreaseBoardHit(BoardVO boardvo) {
		boardDAO.DecreaseBoardHit(boardvo);
	}

	@Override
	public void IncreaseBoardHit(BoardVO boardvo) {
		boardDAO.IncreaseBoardHit(boardvo);
	}

	@Override
	public void modifyBoard(BoardVO vo) {
		boardDAO.modifyBoard(vo);
		
	}

	@Override
	public void boardDelete(BoardVO vo) {
		boardDAO.boardDelete(vo);
		
	}

	@Override
	public void deletBoard_report(BoardVO boardvo) {
		boardDAO.deletBoard_report(boardvo);
		
	}

	@Override
	public List<BoardVO> getFreeBoardList() {
		return boardDAO.getFreeBoardList();
	}

	@Override
	public List<BoardVO> getNotice_board() {
		return boardDAO.getNotice_board();
	}

	@Override
	public List<BoardVO> getGathering_board() {
		return boardDAO.getGathering_board();
	}
	
}
