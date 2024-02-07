package com.MountainCommunity.biz.hit.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.MountainCommunity.biz.board.BoardVO;
import com.MountainCommunity.biz.board.imple.BoardService;
import com.MountainCommunity.biz.hit.HitVO;
import com.MountainCommunity.biz.hit.imple.HitService;

@Controller
public class hitController {
		@Autowired
		private HitService  hitService;
		@Autowired
		private BoardService boardService;
		
		@RequestMapping("/BoardHitDo")
		@ResponseBody
		public String BoardHitDo(HitVO vo,Model model,BoardVO boardvo) {
			System.out.println("BoardHitDo");
			boardvo.setBoard_class(vo.getBoard_class());
			boardvo.setSeq(vo.getSeq());
			if(hitService.checkBoardHit(vo)) {
				hitService.deleteBoardHit(vo);
				boardService.DecreaseBoardHit(boardvo);
				return "false";
			}else {
				hitService.insertBoardHit(vo);
				boardService.IncreaseBoardHit(boardvo);
				return "true"; 
			}
		}	
}
