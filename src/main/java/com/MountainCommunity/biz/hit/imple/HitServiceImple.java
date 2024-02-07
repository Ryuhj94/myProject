package com.MountainCommunity.biz.hit.imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MountainCommunity.biz.hit.HitVO;

@Service("hitService")
public class HitServiceImple implements HitService {

	 @Autowired 
	 private HitDAOMybatis  hitDAO;

	@Override
	public void insertBoardHit(HitVO vo) {
		System.out.println("imple에서 insertBoardHit 처리");
		hitDAO.insertBoardHit(vo);
	}

	@Override
	public boolean checkBoardHit(HitVO vo) {
		System.out.println("imple에서 checkBoardHit 처리");
		return hitDAO.checkBoardHit(vo);
	}

	@Override
	public void deleteBoardHit(HitVO vo) {
		System.out.println("imple에서 deleteBoardHit 처리");
		hitDAO.deleteBoardHit(vo);
	}
	 
}
