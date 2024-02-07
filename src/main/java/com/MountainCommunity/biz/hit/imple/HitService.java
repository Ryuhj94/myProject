package com.MountainCommunity.biz.hit.imple;

import com.MountainCommunity.biz.hit.HitVO;

public interface HitService {

	void insertBoardHit(HitVO vo);

	boolean checkBoardHit(HitVO vo);

	void deleteBoardHit(HitVO vo);
}
