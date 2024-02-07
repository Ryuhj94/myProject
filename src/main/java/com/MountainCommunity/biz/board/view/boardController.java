package com.MountainCommunity.biz.board.view;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.MountainCommunity.biz.board.BoardVO;
import com.MountainCommunity.biz.board.imple.BoardService;
import com.MountainCommunity.biz.coment.ComentVO;
import com.MountainCommunity.biz.coment.imple.ComentService;
import com.MountainCommunity.biz.hit.HitVO;
import com.MountainCommunity.biz.hit.imple.HitService;
import com.MountainCommunity.biz.member.MemberVO;
import com.MountainCommunity.biz.report.ReportVO;
import com.MountainCommunity.biz.report.imple.ReportService;

@Controller
public class boardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private ComentService comentService;
	
	@Autowired
	private HitService  hitService;

	
	@RequestMapping("/mainPage")
	public String MainPage(BoardVO vo,Model model) {
		model.addAttribute("freeList",boardService.getFreeBoardList());
		model.addAttribute("noticeList",boardService.getNotice_board());
		model.addAttribute("gateringList",boardService.getGathering_board());
		return "mainPage";
	}		

		//	테스트용 
		@RequestMapping("/board_write")
		public String freeBoard_write(@RequestParam("board_class") String board_class, Model model) {
			System.out.println("Board_write");
			model.addAttribute("board_class",board_class);
			return "board_write";
	}	
		
		/* sumerNote 이미지 삽입시 db 저장 기능구현
		 * 시간 이미지 저장후 출력은 개발툴의 한계로 바로 출력이 불가능함 실제 배포시 경로는 톰캣으로 하면 x
		 * 단 프로젝트 구현을 위하여 설정함 사진 업로드시 톰캣 저장소에 저장, 로컬 저장소에 저장 되게 코드를 구현하였음 톰캣저장소는 서버 종료시 파일이 삭제되니
		 * 로컬 저장소에 저장을하고 구동시 톰캣에도 저장된 이미지파일을 불러올수 있도록 구현 
		 * 요약하면 실제 img 파일 저장 및 읽기는 톰캣서버 저장소, 이를 저장하고 재구동시 반영되게 로컬저장소에도 저장이되게 함
		 * 설정은 widow-pereferenes-workspace-상단 3개 항목 체크, 이어 바로아래 빌드 항목에도 맨위 체크박스
		 * 
		 *  */
		@RequestMapping(value="/insertBoardimgDo")
		@ResponseBody
		public String insertBoardimgDo(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException {
			System.out.println("=====>insertBoardimgDo 홈컨트롤러");
			String board_img_path = null;
				if(!file.isEmpty()) {
					String fileName = file.getOriginalFilename();
					/* 프로젝트 로컬 저장소 */
					String fileCheck1= "c:/javastudy/spring/MountainCommunity/src/main/webapp/resources/boardimgs/"+fileName;
					FileCopyUtils.copy(file.getBytes(), new File(fileCheck1));
					/* 프로젝트 톰켓 저장소 */
					String fileCheck="C:/javastudy/spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/MountainCommunity/resources/boardimgs/"+ fileName;
					file.transferTo(new File(fileCheck));
					
					if(new File(fileCheck).exists()) {
						board_img_path="./resources/boardimgs/"+ fileName;
						System.out.println(board_img_path);
						System.out.println("성공");
						return board_img_path;
					}
				}
			System.out.println("이미지 삽입에 실패하였습니다.");
			return board_img_path;
		}	
		


		@RequestMapping(value = "/board_list", method = {RequestMethod.GET, RequestMethod.POST})
		public String board_list(
				@RequestParam(value="board_class", required = false, defaultValue = "") String board_class,
				@RequestParam(value="pagingNum", required = false, defaultValue = "0") int pagingNum,
				Model model,BoardVO vo)
		{
			System.out.println("보드리스트 맵핑 접근"+ boardService.changBoardClassNameKR(board_class));
			System.out.println("여기");
			model.addAttribute("board_class_kr",boardService.changBoardClassNameKR(board_class));
			if(vo.getPagingNum()==0) {
				vo.setPagingNum(pagingNum);
			}
			if(board_class!="") {
				vo.setBoard_class(board_class);		
			}
			
			if(vo.getSearchKeyword()==null) {
				vo.setSearchKeyword("");
			}
	
			if(vo.getSearchCondition()==null) {
				vo.setSearchCondition("title");
			}
			if(vo.getHiddenPageSize()==0&&vo.getPageSize()==0) {
				vo.setPageSize(30);
			}
			else if(vo.getHiddenPageSize()!=0&&vo.getPageSize()==0){
				vo.setPageSize(vo.getHiddenPageSize());
			}
			vo.setTotalPage(boardService.getBoardCount(vo));;
			model.addAttribute("boardList",boardService.getBoardList(vo)); //보드 리스트
			model.addAttribute("board",vo);	//총페이지(검색 + pageSize)
			return "board_list";
		}	
		
		@RequestMapping(value = "/board_list_link", method = {RequestMethod.GET, RequestMethod.POST})
		public String board_list_link(
				@RequestParam("board_class") String board_class,
				@RequestParam(value="pagingNum", required = false, defaultValue = "0") int pagingNum,
				@RequestParam(value="searchKeyword", required = false, defaultValue = "") String SearchKeyword,
				@RequestParam(value="SearchCondition", required = false,defaultValue = "title") String SearchCondition,
				@RequestParam(value="pageSize", required = false, defaultValue = "30") int pageSize,
				BoardVO vo,
				Model model)
		{
			if(SearchKeyword==null) {
				vo.setSearchKeyword("");
			}
	
			if(SearchCondition==null) {
				vo.setSearchCondition("title");
			}
			vo.setBoard_class(board_class);
			vo.setPagingNum(pageSize);
			vo.setSearchKeyword(SearchKeyword);
			vo.setSearchCondition(SearchCondition);
			vo.setPageSize(pageSize);
			vo.setPagingNum(pagingNum);
			model.addAttribute("board_class_kr",boardService.changBoardClassNameKR(board_class));
			vo.setTotalPage(boardService.getBoardCount(vo));;
			model.addAttribute("boardList",boardService.getBoardList(vo)); //보드 리스트
			model.addAttribute("board",vo);	//총페이지(검색 + pageSize)
			return "board_list";
		}	
		
		@RequestMapping("/insertBoardDo")
		public String insertBoard(BoardVO vo) {
			System.out.println("writeDo");
			boardService.insertBoard(vo);  
			return "redirect:/board_list?board_class=" + vo.getBoard_class() + "&pagingNum=0";

		}		
		
		
		@RequestMapping("/board_views")
		public String board_views(BoardVO vo,Model model,ComentVO comentvo,HitVO hitVo, HttpSession session,
				@RequestParam(value = "seq", required = false) Integer seq,
				@RequestParam(value="board_class", required = false) String board_class
				) {
			System.out.println("board_write");
			model.addAttribute("board_class_kr",boardService.changBoardClassNameKR(board_class));
			System.out.println("이상하네"+seq);
			vo.setSeq(seq);
			vo.setBoard_class(board_class);
			comentvo.setComment_class(vo.getBoard_class());
			boardService.increaseViewsBoard(vo); //조회수 증가 
			MemberVO memberVO = (MemberVO) session.getAttribute("member");
			if(memberVO == null||memberVO.getId()==null) {
				model.addAttribute("hitState", false);
			}
			else if(memberVO.getId()!=null) {
				hitVo.setBoard_class(board_class);
				hitVo.setId(memberVO.getId());
				hitVo.setSeq(seq);
				if(hitService.checkBoardHit(hitVo)) {
					model.addAttribute("hitState", true);
				}
				else {
					model.addAttribute("hitState", false);
				}
			}
			model.addAttribute("board", boardService.getBoard(vo));
			model.addAttribute("comentList",comentService.getComentList(comentvo));
			return "board_views";
		}	
		
		@RequestMapping("/board_modify")
		public String modifyBoard(BoardVO vo,Model model,
				@RequestParam(value="seq", required = false) int seq,
				@RequestParam(value="board_class", required = false) String board_class) {
			vo.setBoard_class(board_class);
			vo.setSeq(seq);
			vo= boardService.getBoard(vo); 
			model.addAttribute("board",vo);
			return "board_modify";
		}		
		
		@RequestMapping("/modifyBoardDo")
		public String modifyBoardDo(BoardVO vo,Model model) {
			StringBuffer strContent = new StringBuffer(vo.getContent());
			StringBuffer strTitle = new StringBuffer(vo.getTitle());
			strContent.insert(0, "수정 )");
			strTitle.insert(0, "수정 )");
			vo.setContent(strContent.toString());
			vo.setTitle(strTitle.toString());
			System.out.println("종류"+vo.getBoard_class());
			System.out.println("내용"+vo.getContent());
			System.out.println("번호"+vo.getSeq());
			System.out.println("제목"+vo.getTitle());
			boardService.modifyBoard(vo);
			model.addAttribute("board",vo);
			return "redirect:/board_views?board_class="+vo.getBoard_class()+"&seq="+vo.getSeq();
		}		
		
		@RequestMapping("/boardDelete")
		public String boardDelete(BoardVO vo,Model model,ComentVO comentvo) {
			boardService.boardDelete(vo);
			comentvo.setComment_class(vo.getBoard_class());
			comentvo.setSeq(vo.getSeq());
			comentService.commentDelete(comentvo);
			return "redirect:/mainPage";
		}		

}
