package com.MountainCommunity.biz.board.imple;

import java.util.List;

import com.MountainCommunity.biz.board.BoardVO;

public interface BoardService {
	//단순 이름바꾸기
	String changBoardClassNameKR(String board_class);
	//보드 입력
	void insertBoard(BoardVO vo);
	//보드 리스트받기
	List<BoardVO> getBoardList(BoardVO vo);
	int getBoardCount(BoardVO vo);
	String board_list_sizeDo(BoardVO vo);
	
	BoardVO getBoard(BoardVO vo);
	void increaseViewsBoard(BoardVO vo);
	void DecreaseBoardHit(BoardVO boardvo);
	void IncreaseBoardHit(BoardVO boardvo);
	void modifyBoard(BoardVO vo);
	void boardDelete(BoardVO vo);
	void deletBoard_report(BoardVO boardvo);
	List<BoardVO> getFreeBoardList();
	List<BoardVO> getNotice_board();
	List<BoardVO> getGathering_board();


}
