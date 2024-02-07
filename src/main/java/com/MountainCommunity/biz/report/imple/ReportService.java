package com.MountainCommunity.biz.report.imple;

import java.util.List;

import com.MountainCommunity.biz.coment.ComentVO;
import com.MountainCommunity.biz.report.ReportVO;

public interface ReportService {

	void insertReport(ReportVO vo);

	List<ReportVO> getreportList(ReportVO reoprtvo);

	void deletecoment(ReportVO reportvo);

}
