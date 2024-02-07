package com.MountainCommunity.biz.comment.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MountainCommunity.biz.coment.ComentVO;
import com.MountainCommunity.biz.coment.imple.ComentService;

@Controller
public class commentController {

	@Autowired
	private ComentService comentService;

	@RequestMapping("/comentWriteDo")
	public String comentWriteDo(ComentVO vo,Model model) {
		int pageNum=vo.getSeq();
		System.out.println("comentWriteDo");
		comentService.comentWriteDo(vo);
		vo.setGroup_num(comentService.getMAXseq_comment(vo));
		System.out.println("컨트롤러에서 결과 그룹넘" + vo.getGroup_num() );
		comentService.updateGroupNum(vo);
		return "redirect:/board_views?board_class=" + vo.getComment_class() + "&seq=" + pageNum;
	}	

	@RequestMapping("/replysWriteDo")
	public String replysWriteDo(ComentVO vo,Model model) {
		System.out.println("replysWriteDo");
		vo.setStap_num(vo.getStap_num()+1);
		vo.setIndent_num(vo.getIndent_num()+1);
		comentService.updateStapNum(vo);
		comentService.replysWriteDo(vo);
		 return "redirect:/board_views?board_class="  + vo.getComment_class() + "&seq="+vo.getSeq() ;
	}		
}
