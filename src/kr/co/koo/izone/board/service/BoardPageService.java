package kr.co.koo.izone.board.service;

import java.util.*;

import kr.co.koo.izone.board.model.BoardVO;

public class BoardPageService {

	private int messageTotalCount; //총 게시글 수
	private int currentPageNumber; //현재 위치한 페이지번호
	private List<BoardVO> messageList; //DB로부터 전달받은 게시글 목록
	private int pageTotalCount; //총 페이지 수
	private int messageCountPerPage; //한 페이지당 들어갈 게시물 수
	private int firstRow; //첫행
	private int endRow; //마지막 행

	public BoardPageService(List<BoardVO> messageList, int messageTotalCount, 
			int currentPageNumber, int messageCountPerPage, 
			int startRow, int endRow) {
		this.messageList = messageList;
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;

		calculatePageTotalCount();
	}
	
	//총 페이지 수를 계산하는 메서드
	private void calculatePageTotalCount() {
		if (messageTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = messageTotalCount / messageCountPerPage;
			if (messageTotalCount % messageCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getMessageTotalCount() {
		return messageTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<BoardVO> getMessageList() {
		return messageList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return messageTotalCount == 0;
	}
}


