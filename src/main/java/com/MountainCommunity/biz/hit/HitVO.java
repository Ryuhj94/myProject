package com.MountainCommunity.biz.hit;

public class HitVO {

	private int seq; 
	private int seq_comment;
	private String id; 
    private String board_class;
    private String comment_class;
    
    
	public String getBoard_class() {
		return board_class;
	}
	public String getComment_class() {
		return comment_class;
	}
	public void setBoard_class(String board_class) {
		this.board_class = board_class;
	}
	public void setComment_class(String comment_class) {
		this.comment_class = comment_class;
	}
	public int getSeq() {
		return seq;
	}
	public int getSeq_comment() {
		return seq_comment;
	}
	public String getId() {
		return id;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
	}
	public void setId(String id) {
		this.id = id;
	}

    
    
}
