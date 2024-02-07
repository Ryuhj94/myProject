package com.MountainCommunity.biz.hit.imple;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MountainCommunity.biz.hit.HitVO;

@Repository
public class HitDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertBoardHit(HitVO vo) {
		System.out.println("===> Mybatis로 insertBoardHit() 기능 처리");
			mybatis.insert("hitDAO.board_insertBoardHit",vo); 
		
	}

	public boolean checkBoardHit(HitVO vo) {
			return mybatis.selectOne("hitDAO.board_checkBoardHit",vo);
	}

	public void deleteBoardHit(HitVO vo) {
			mybatis.delete("hitDAO.board_deleteBoardHit",vo);
		
	}
	
	
	
	
}


