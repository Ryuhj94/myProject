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

	public String getMemberList(MemberVO vo) {
		System.out.println("===> Mybatis로 getMemberList() 기능 처리");
		List<MemberVO> list= mybatis.selectList("MemberDAO.getMemberList",vo);
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		
		for(int i=0; i<list.size(); i++) {
			MemberVO dto=list.get(i);
			/*
			 * result.append("[{\"id\":\"" + dto.getId() + "\"},");
			 * result.append("[{\"password\":\"" + dto.getPassword() + "\"},");
			 * result.append("[{\"name\":\"" + dto.getName() + "\"},");
			 * result.append("[{\"birthdate\":\"" + dto.getBirthdate() + "\"},");
			 * result.append("[{\"mail\":\"" + dto.getMail() + "\"},");
			 * result.append("[{\"nickname\":\"" + dto.getNickname() + "\"},");
			 * result.append("[{\"join_date\":\"" + dto.getJoin_date() + "\"},");
			 * result.append("[{\"block_info\":\"" + dto.isBlock_info() + "\"},");
			 * result.append("[{\"sex\":\"" + dto.getSex() + "\"},");
			 * result.append("[{\"nationality\":\"" + dto.getNationality() + "\"},");
			 * result.append("[{\"profile_img_path\":\"" + dto.getProfile_img_path() +
			 * "\"},"); result.append("[{\"account_permissions\":\"" +
			 * dto.getAccount_permissions() + "\"},"); if(i != list.size()-1)
			 * result.append(",");
			 */
			 result.append("{\"id\":\"" + dto.getId() + "\",");
			    result.append("\"password\":\"" + dto.getPassword() + "\",");
			    result.append("\"name\":\"" + dto.getName() + "\",");
			    result.append("\"birthdate\":\"" + dto.getBirthdate() + "\",");
			    result.append("\"mail\":\"" + dto.getMail() + "\",");
			    result.append("\"nickname\":\"" + dto.getNickname() + "\",");
			    result.append("\"join_date\":\"" + dto.getJoin_date() + "\",");
			    result.append("\"block_info\":\"" + dto.isBlock_info() + "\",");
			    result.append("\"sex\":\"" + dto.getSex() + "\",");
			    result.append("\"nationality\":\"" + dto.getNationality() + "\",");
			    result.append("\"profile_img_path\":\"" + dto.getProfile_img_path() + "\",");
			    result.append("\"account_permissions\":\"" + dto.getAccount_permissions() + "\"}");
			    if (i != list.size() - 1) { result.append(",");}
			
		}
		result.append("]}");
		return result.toString();
	}

//	// 회원정보 수정
//	public void updateMember(MemberVO vo) {
//		System.out.println("===> Mybatis로 updateMember() 기능 처리");
//		mybatis.update("MemberDAO.updateBoard", vo);
//	};
//
//	// 회원 탈퇴
//	public void deleteMember(MemberVO vo) {
//		System.out.println("===> Mybatis로 deleteMember() 기능 처리");
//		mybatis.delete("MemberDAO.deleteBoard", vo);	
//	};
//	// 회원 정보
//	public void getMember(MemberVO vo) {
//		System.out.println("===> Mybatis로 deleteMember() 기능 처리");
//		mybatis.delete("MemberDAO.deleteBoard", vo);	
//	};
//	// 회원 정보 리스트 확인
//	public MemberVO getBoard(MemberVO vo) {
//		System.out.println("===> Mybatis로 getBoard() 기능 처리");
//		return null;
//	};

}
