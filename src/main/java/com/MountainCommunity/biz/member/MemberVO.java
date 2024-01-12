package com.MountainCommunity.biz.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String birthdate;
	private String mail;
	private String nickname;
	private Date join_date;
	private boolean block_info;
	private String sex;
	private String nationality;
	private String profile_img_path;
	private String account_permissions;
	private MultipartFile uploadFile;
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getSex() {
		return sex;
	}
	public String getNationality() {
		return nationality;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getMail() {
		return mail;
	}
	public String getNickname() {
		return nickname;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public boolean isBlock_info() {
		return block_info;
	}
	public String getProfile_img_path() {
		return profile_img_path;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public void setBlock_info(boolean block_info) {
		this.block_info = block_info;
	}
	public void setProfile_img_path(String profile_img_path) {
		this.profile_img_path = profile_img_path;
	}
	public String getAccount_permissions() {
		return account_permissions;
	}
	public void setAccount_permissions(String account_permissions) {
		this.account_permissions = account_permissions;
	}
}
