package com.MountainCommunity.biz.coment.imple;

import java.util.List;

import com.MountainCommunity.biz.coment.ComentVO;

public interface ComentService {

	//코멘트 달기
	void comentWriteDo(ComentVO vo);
	//댓글 가져오기
	List<ComentVO>getComentList(ComentVO vo);
	//댓글 작성후 seq값 가져오기
	int getMAXseq_comment(ComentVO vo);
	//댓글 작성후 그룹넘 seq값 주기
	void updateGroupNum(ComentVO vo);
	//대댓글 작성
	void replysWriteDo(ComentVO vo);
	//스탭넘갱신
	void updateStapNum(ComentVO vo);
	void commentDelete(ComentVO comentvo);
	void deleltComment_report(ComentVO comentvo);
	void deletBoardcoment(ComentVO comentvo);
}
