package com.MountainCommunity.biz.report.imple;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.MountainCommunity.biz.coment.ComentVO;
import com.MountainCommunity.biz.report.ReportVO;

@Repository
public class ReportDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertReport(ReportVO vo) {
		System.out.println("===> Mybatis로 insertReport() 기능 처리");
		if(vo.getBoard_class()!=null) {
			System.out.println("게시물 신고");
			mybatis.insert("reportDAO.insertBoardReport", vo);
		}
		else {
			System.out.println("댓글신고");
			mybatis.insert("reportDAO.insertCommentReport", vo);
		}
		
	}

	public List<ReportVO> getreportList(ReportVO commentvo) {
		return mybatis.selectList("reportDAO.getreportList", commentvo);
	}

	public void deletecoment(ReportVO reportvo) {
		mybatis.delete("reportDAO.deletecoment",reportvo);
	}
	

}
