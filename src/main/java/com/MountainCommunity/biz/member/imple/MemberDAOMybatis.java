package com.MountainCommunity.biz.member.imple;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.MountainCommunity.biz.member.MemberVO;;

@Repository
public class MemberDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
 	public void joinMember(MemberVO vo) {
		System.out.println("===> Mybatis로 joinMember() 기능 처리");
		mybatis.insert("MemberDAO.joinMember", vo);
 	};
 	
 	public MemberVO loginMember(MemberVO vo) {
		System.out.println("===> Mybatis로 loginMember() 기능 처리");
		return (MemberVO)mybatis.selectOne("MemberDAO.loginMember", vo);
 	}

	public int idCheck(MemberVO vo) {
		System.out.println("===> Mybatis로 idCheck() 기능 처리");
		return mybatis.selectOne("MemberDAO.idCheck", vo);
	}

	public void usermodify(MemberVO vo) {
		System.out.println("===> Mybatis로 usermodify() 기능 처리");
		mybatis.update("MemberDAO.usermodify", vo);
	}
	
	  public List<MemberVO> getMemberList(MemberVO vo) {
	  System.out.println("===> Mybatis로 getMemberList() 기능 처리");
	  return mybatis.selectList("MemberDAO.getMemberList",vo); 
	  
	  }
		public void blockDO(MemberVO vo) {
			mybatis.update("MemberDAO.blockDO",vo); 
		}

		public void blockClear(MemberVO vo) {
			mybatis.update("MemberDAO.blockClear",vo); 
		}
	

}
