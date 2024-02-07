package com.MountainCommunity.biz;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.MountainCommunity.biz.board.BoardVO;
import com.MountainCommunity.biz.board.imple.BoardService;
import com.MountainCommunity.biz.coment.ComentVO;
import com.MountainCommunity.biz.coment.imple.ComentService;
import com.MountainCommunity.biz.hit.HitVO;
import com.MountainCommunity.biz.hit.imple.HitService;
import com.MountainCommunity.biz.member.MemberVO;
import com.MountainCommunity.biz.member.imple.MemberService;
import com.MountainCommunity.biz.report.ReportVO;
import com.MountainCommunity.biz.report.imple.ReportService;
import com.mysql.cj.Session;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ComentService comentService;
	
	@Autowired
	private HitService  hitService;
	
	@Autowired
	private ReportService reportService;
	
	// 단순페이지이동======================
	@RequestMapping("/login")
	public String login() {
		return "login";
	}	
	@RequestMapping("join")
	public String join() {
		return "join";
	}	
	@RequestMapping("user_info")
	public String user_info() {
		return "user_info";
	}	
	

		
//============================================Coment ======================================

		
		
		
		
		//============================================Hit ======================================		
		

		//============================================Hit ======================================	

		
		//============================================관리자페이지 ======================================		

		//관리자 페이지
		@RequestMapping("/adminpage")
		public String adminpage(ReportVO reoprtvo, MemberVO membervo,Model model) {
			model.addAttribute("memberList",memberService.getMemberList(membervo)); 
			model.addAttribute("reportList",reportService.getreportList(reoprtvo)); 
			return "adminpage";
		}	
		
		@RequestMapping("/reportDeletDo")
		public String reportDeletDo(ReportVO reportvo, ComentVO comentvo, BoardVO boardvo) {
			System.out.println("들어온 보드클래스"+reportvo.getBoard_class());
			System.out.println("들어온 코맨트 클래스"+reportvo.getComment_class());
			
			if(reportvo.getComment_class()!=null&&reportvo.getComment_class()!="") {
				System.out.println("댓글삭제 실시");
				comentvo.setComment_class(reportvo.getComment_class());
				comentvo.setSeq(reportvo.getSeq());
				comentvo.setSeq_comment(reportvo.getSeq_comment());	
				comentService.deleltComment_report(comentvo);
				reportService.deletecoment(reportvo);
			}
			else if(reportvo.getBoard_class()!=null&&reportvo.getBoard_class()!="") {
				System.out.println("보드삭제 실시");
				boardvo.setBoard_class(reportvo.getBoard_class());
				boardvo.setSeq(reportvo.getSeq());
				comentvo.setSeq(reportvo.getSeq());
				comentvo.setComment_class(reportvo.getBoard_class());
				boardService.deletBoard_report(boardvo);
				comentService.deletBoardcoment(comentvo);
				reportService.deletecoment(reportvo);
			}
			return "redirect:/adminpage";
		}	
		
		
		
}








	