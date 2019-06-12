package com.spring.myapp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myapp.board.dao.IBoardDAO;
import com.spring.myapp.board.vo.BoardVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	IBoardDAO boardDAO;

	@Override
	public void writeBoard(String name, String title, String content) {
		boardDAO.writeBoard(name, title, content);
	}

	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}

	@Override
	public BoardVO getBoardContent(int boardnum) {
		return boardDAO.getBoardContent(boardnum);
	}

	@Override
	public void deleteBoard(int boardnum) {
		boardDAO.deleteBoard(boardnum);
	}

	@Override
	public void updateBoard(BoardVO board) {
		boardDAO.updateBoard(board);
	}

	@Override
	public void hitPlus(int boardnum) {
		boardDAO.hitPlus(boardnum);
	}
}
