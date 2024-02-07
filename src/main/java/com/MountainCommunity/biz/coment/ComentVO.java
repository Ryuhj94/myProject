package com.MountainCommunity.biz.coment;

import java.sql.Date;

public class ComentVO {
	private int seq_comment;
	private String comment_class;
	private int seq;
	private String id;
	private int stap_num;
	private int indent_num;
	private int group_num;
	private String content;
	private int hit;
	private Date write_date;
	private String profile_img_path;
	
	
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public String getProfile_img_path() {
		return profile_img_path;
	}
	public void setProfile_img_path(String profile_img_path) {
		this.profile_img_path = profile_img_path;
	}
	public int getSeq_comment() {
		return seq_comment;
	}
	public String getComment_class() {
		return comment_class;
	}
	public int getSeq() {
		return seq;
	}
	public String getId() {
		return id;
	}
	public int getStap_num() {
		return stap_num;
	}
	public int getIndent_num() {
		return indent_num;
	}
	public String getContent() {
		return content;
	}
	public int getHit() {
		return hit;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
	}
	public void setComment_class(String comment_class) {
		this.comment_class = comment_class;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setStap_num(int stap_num) {
		this.stap_num = stap_num;
	}
	public void setIndent_num(int indent_num) {
		this.indent_num = indent_num;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
}