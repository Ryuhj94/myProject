package com.MountainCommunity.biz.member.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MountainCommunity.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDAOMybatis memberDAO;
	@Override
	public void joinMember(MemberVO vo) {
		System.out.println("joinMember 회원가입 처리");
		memberDAO.joinMember(vo);
	}
	@Override
	public MemberVO loginMember(MemberVO vo) {
		System.out.println("loginMember 로그인 처리");
		return memberDAO.loginMember(vo);		
	}
	
	@Override
	public int idCheck(MemberVO vo) {
		System.out.println("idCheck 로그인 처리");
		return memberDAO.idCheck(vo);
	}
	@Override
	public void usermodify(MemberVO vo) {
		System.out.println("usermodify 처리");
		memberDAO.usermodify(vo);
	}
	
	@Override
	public String getMemberList(MemberVO vo) {
		System.out.println("getMemberList 처리");
		return memberDAO.getMemberList(vo);
	}

	
	@Override
	public void updateMember(MemberVO vo) {
		
	}

	@Override
	public void deleteMember(MemberVO vo) {
		
	}
	@Override
	public MemberVO getBoard(MemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
