package com.spring.myapp.board.service;

import java.util.List;

import com.spring.myapp.board.vo.BoardVO;

public interface IBoardService {

	void writeBoard(String name, String title, String content);
	List<BoardVO> getBoardList();
	BoardVO getBoardContent(int boardnum);
	void deleteBoard(int boardnum);
	void updateBoard(BoardVO board);
	void hitPlus(int boardnum);
}
