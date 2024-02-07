package com.MountainCommunity.biz.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int seq;
	private String id;
	private String title;
	private String content;
	private int views;
	private String board_img_path;
	private int hit; 
	private Date write_date;
	private String board_class;
	private MultipartFile file;
	private String searchCondition;
	private String searchKeyword;
	private int hiddenPageSize;
	private int totalPage;
	private int pageSize;
	private int pagingNum;
	
	public int getHiddenPageSize() {
		return hiddenPageSize;
	}
	public void setHiddenPageSize(int hiddenPageSize) {
		this.hiddenPageSize = hiddenPageSize;
	}
	public int getPagingNum() {
		return pagingNum;
	}
	public void setPagingNum(int pagingNum) {
		this.pagingNum = pagingNum;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getBoard_img_path() {
		return board_img_path;
	}
	public void setBoard_img_path(String board_img_path) {
		this.board_img_path = board_img_path;
	}
	public int getSeq() {
		return seq;
	}
	public String getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public int getViews() {
		return views;
	}
	public int getHit() {
		return hit;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public String getBoard_class() {
		return board_class;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public void setBoard_class(String board_class) {
		this.board_class = board_class;
	}
}
