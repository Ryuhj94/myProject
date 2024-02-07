package com.MountainCommunity.biz.report.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MountainCommunity.biz.coment.ComentVO;
import com.MountainCommunity.biz.report.ReportVO;

@Service("reportService")
public class ReportServiceImple implements ReportService {
	
	@Autowired
	private ReportDAOMybatis reportDAO;

	@Override
	public void insertReport(ReportVO vo) {
		reportDAO.insertReport(vo);
		
	}

	@Override
	public List<ReportVO> getreportList(ReportVO commentvo) {
		return reportDAO.getreportList(commentvo);
	}

	@Override
	public void deletecoment(ReportVO reportvo) {
		reportDAO.deletecoment(reportvo);
		
	}

}
