package com.MountainCommunity.biz.report.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MountainCommunity.biz.report.ReportVO;
import com.MountainCommunity.biz.report.imple.ReportService;

public class reportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/insertReport")
	public String insertReport(ReportVO vo, Model model) {
	    reportService.insertReport(vo);
	    if(vo.getBoard_class()==null) {
	    	vo.setBoard_class(vo.getComment_class());
	    }
	    return "redirect:/board_list?board_class="  + vo.getBoard_class();
	}
}
