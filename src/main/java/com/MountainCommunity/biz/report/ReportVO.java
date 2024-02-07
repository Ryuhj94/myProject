package com.MountainCommunity.biz.report;

import java.sql.Date;

public class ReportVO {
	private int seq;
	private int seq_comment;
	private String comment_class;
	private String board_class ;
	private String id;
	private String reporter;
	private String content;
	private String  report_type;
	private Date report_date;
	private int no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public int getSeq() {
		return seq;
	}
	public int getSeq_comment() {
		return seq_comment;
	}
	public String getComment_class() {
		return comment_class;
	}
	public String getBoard_class() {
		return board_class;
	}
	public String getId() {
		return id;
	}
	public String getReporter() {
		return reporter;
	}
	public String getContent() {
		return content;
	}
	public String getReport_type() {
		return report_type;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
	}
	public void setComment_class(String comment_class) {
		this.comment_class = comment_class;
	}
	public void setBoard_class(String board_class) {
		this.board_class = board_class;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}
	
}
