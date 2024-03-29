package com.MountainCommunity.biz.member.view;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.MountainCommunity.biz.member.MemberVO;
import com.MountainCommunity.biz.member.imple.MemberService;

@Controller
public class memberController {

	@Autowired
	private MemberService memberService;

	//======================
	
	//회원가입
	@RequestMapping("/joinDO") 
	public String insertUser(MemberVO vo) {
		System.out.println("=====>insertUser 홈컨트롤러");
		if(memberService.idCheck(vo)==0) {
		vo.setNickname(vo.getId());
		System.out.println(vo.getNickname()+"닉네임체크");
		memberService.joinMember(vo);
		return "login";
		}
		else {
			return "join";
		}
	}	

	//중복 아이디체크
	@RequestMapping("/idCheckDO") 
	public void idCheck(MemberVO vo, HttpServletRequest request, HttpServletResponse response)throws IOException {
		System.out.println("=====>idCheckDO 홈컨트롤러");
		PrintWriter out = response.getWriter();
		int result=memberService.idCheck(vo);
		out.write(String.valueOf(result));
	}	

	
	
	//로그인
	@RequestMapping("/loginDo")  
	public String loginMember(MemberVO vo, HttpSession session, Model model) {
		System.out.println("=====>loginDo 홈컨트롤러");
		MemberVO checkVO=memberService.loginMember(vo);
		
		if(checkVO != null && !checkVO.getName().isEmpty()) {
			if(checkVO.isBlock_info()) {
				model.addAttribute("block", true);
				return "login";
			}
			session.setAttribute("member", checkVO);
			model.addAttribute("resultPage", "loginok");
			return "mainPage";
		}
		else {
			model.addAttribute("loginFail", true);
			return "login";
		}
	}
	//로그아웃
	@RequestMapping("/logoutDo")  
	public String logoutMember(HttpSession session) {
		System.out.println("=====>logoutDo 홈컨트롤러");
		session.invalidate();
		return "redirect:mainPage";
	}
	
	// 회원 정보수정  profile_img_path
	@RequestMapping(value="/usermodifyDo")
	public String usermodify(MemberVO vo,HttpSession session) throws IOException {
		System.out.println("=====>usermodifyDo 홈컨트롤러");
		String profile_img_path;
		// 파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("c:/javastudy/spring/MountainCommunity/src/main/webapp/resources/frofile_download/" + fileName));
			profile_img_path="./resources/frofile_download/"+fileName;
			vo.setProfile_img_path(profile_img_path);
		}else if(vo.getProfile_img_path()==null||vo.getProfile_img_path()==""){
			profile_img_path="./resources/frofile_download/defaultimg.png";
			vo.setProfile_img_path(profile_img_path);
		}
		memberService.usermodify(vo);
		session.invalidate();
		return "redirect:mainPage";
	}	
	

	@RequestMapping("/blockDO")
	public String blockDO(MemberVO vo,
			@RequestParam(value="id", required = false, defaultValue = "") String id) {
		vo.setId(id);
		memberService.blockDO(vo);
		return "redirect:adminpage";
	}		
	@RequestMapping("/blockClear")
	public String blockClear(MemberVO vo,@RequestParam(value="id", required = false, defaultValue = "") String id){
		vo.setId(id);
		memberService.blockClear(vo);
		return "redirect:adminpage";
	}	
}
