package com.MountainCommunity.biz.coment.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MountainCommunity.biz.coment.ComentVO;


@Service("comentService")
public class ComentServiceImple implements ComentService{
	
	 @Autowired 
	 private ComentDAOMybatis comentDAO;

	@Override
	public void comentWriteDo(ComentVO vo) {
		System.out.println("ComentServiceImple 에서 comentWriteDo처리");
		comentDAO.comentWriteDo(vo);
	}

	@Override
	public List<ComentVO> getComentList(ComentVO vo) {
		System.out.println("ComentServiceImple 에서 getComentList처리");
		return comentDAO.getComentList(vo);
	}

	@Override
	public int getMAXseq_comment(ComentVO vo) {
		return comentDAO.getMAXseq_comment(vo);
	}

	@Override
	public void updateGroupNum(ComentVO vo) {
		comentDAO.updateGroupNum(vo);
	}

	@Override
	public void replysWriteDo(ComentVO vo) {
		comentDAO.replysWriteDo(vo);
		
	}

	@Override
	public void updateStapNum(ComentVO vo) {
		comentDAO.updateStapNum(vo);
		
	}

	@Override
	public void commentDelete(ComentVO comentvo) {
		comentDAO.commentDelete(comentvo);
		
	}

	@Override
	public void deleltComment_report(ComentVO comentvo) {
		comentDAO.deleltComment_report(comentvo);
		
	}

	@Override
	public void deletBoardcoment(ComentVO comentvo) {
		comentDAO.deletBoardcoment(comentvo);
		
	}
}
