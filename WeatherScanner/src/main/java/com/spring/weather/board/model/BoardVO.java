package com.spring.weather.board.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class BoardVO {
	
	private int boardNo;
	private String title;
	private String content;
	private String memberId;
	private Date regDate;
	private int viewCnt;
	private int replyCnt;
//	private String addFile;
	private int likeCnt;
	
	
	private boolean newMark; //신규 게시물에 new를 띄울지 결정하는 논리필드.
	
	/////////////////////////////첨부파일
	private MultipartFile file;

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public void setTitle(String title) {
		System.out.println("setTitle호출!");
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
//	private String fileName;
//	private long fileSize;
//	private String fileContentType;
//	private int fileNo;

	
	
}
