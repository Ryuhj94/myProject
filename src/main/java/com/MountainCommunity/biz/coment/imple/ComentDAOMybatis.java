package com.MountainCommunity.biz.coment.imple;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MountainCommunity.biz.coment.ComentVO;

@Repository
public class ComentDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void comentWriteDo(ComentVO vo) {
		System.out.println("===> Mybatis로 comentWriteDo() 기능 처리");
			mybatis.insert("ComentDAO.board_writeComent", vo);
	}

	public List<ComentVO> getComentList(ComentVO vo) {
		System.out.println("===> Mybatis로 getComentList() 기능 처리");
		 	return mybatis.selectList("ComentDAO.board_getComentList", vo);
	}

	public int getMAXseq_comment(ComentVO vo) {
		System.out.println("===> Mybatis로 getMAXseq_comment() 기능 처리");
		return mybatis.selectOne("ComentDAO.board_getMAXseq_comment",vo);
	}

	public void updateGroupNum(ComentVO vo) {
		System.out.println("===> Mybatis로 updateGroupNum() 기능 처리");
			mybatis.update("ComentDAO.board_updateGroupNum",vo);
	}

	public void replysWriteDo(ComentVO vo) {
		System.out.println("===> Mybatis로 updateGroupNum() 기능 처리");
			mybatis.insert("ComentDAO.board_replysWriteDo",vo);
	}

	public void updateStapNum(ComentVO vo) {
		System.out.println("===> Mybatis로 updateGroupNum() 기능 처리");
			mybatis.update("ComentDAO.board_updateStapNum",vo);
	}

	public void commentDelete(ComentVO comentvo) {
		mybatis.delete("ComentDAO.commentDelete",comentvo);
	}

	public void deleltComment_report(ComentVO comentvo) {
		mybatis.delete("ComentDAO.deleltComment_report",comentvo);
		
	}

	public void deletBoardcoment(ComentVO comentvo) {
		mybatis.delete("ComentDAO.deletBoardcoment",comentvo);
		
	}
	
	
}
