package com.spring.weather.likeit.model;

import lombok.Data;

@Data
public class LikeitVO {

	private int boardNo;
	private String memberId;
	private int likeCnt;
	private int likeNo;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	@Override
	public String toString() {
		return "LikeitVO [boardNo=" + boardNo + ", memberId=" + memberId + ", likeCnt=" + likeCnt + ", likeNo=" + likeNo
				+ "]";
	}
	
	
}
