package com.MountainCommunity.biz.member.imple;

import java.util.List;

import com.MountainCommunity.biz.member.MemberVO;


public interface MemberService {

	// 회원 가입	
	void joinMember(MemberVO vo);
	// 로그인
	MemberVO loginMember(MemberVO vo);
	// 회원정보 수정
	void updateMember(MemberVO vo);

	// 회원 탈퇴
	void deleteMember(MemberVO vo);

	// 회원 정보확인
	MemberVO getBoard(MemberVO vo);
	
	// 아이디 체크
	int idCheck(MemberVO vo);
	
	// 회원 정보수정
	void usermodify(MemberVO vo);
	// 회원 리트스
	String getMemberList(MemberVO vo);

}
