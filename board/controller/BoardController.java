package com.spring.myapp.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.myapp.board.service.IBoardService;
import com.spring.myapp.board.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	IBoardService boardService;

	@RequestMapping(value="board/write", method = RequestMethod.GET)
	public String boardWrite(HttpSession session, Model model) {
		if(session.getAttribute("id") == null) {
			return "redirect: ../";
		}
		String id= (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		return "/board/board_form";
	}

	@RequestMapping(value="board/write", method = RequestMethod.POST)
	public String boardWrtie(String name, String title, String content, Model model) {
		boardService.writeBoard(name, title, content);
		return "redirect:../";
	}

	@RequestMapping(value="board/list")
	public String showBoard(HttpSession session, Model model) {
		if(session.getAttribute("id") == null) {
			return "redirect: ../";
		} else { 
			model.addAttribute("list", boardService.getBoardList());
			return "board/board_list";
		}
	}

	@RequestMapping(value="board/detail/{boardnum}")
	public String showBoardDetail( @PathVariable int boardnum, HttpSession session, Model model) {
		if(session.getAttribute("id") ==null ) {
			return "redirect: ../";
		} else {
			BoardVO boards= boardService.getBoardContent(boardnum);
			if(boards == null) {
				return "redirect:../list";
			} else {
				boardService.hitPlus(boardnum);
				BoardVO board= boardService.getBoardContent(boardnum);
				model.addAttribute("board", board);
				return "board/board_detail";
			}
		}
	}

	@RequestMapping(value="board/delete/{boardnum}")
	public String deleteBoard(@PathVariable int boardnum,HttpSession session, Model model) {
		if(session.getAttribute("id") ==null ) {
			return "redirect: ../../";
		} else {
			String uname = (String)session.getAttribute("name");
			model.addAttribute("name",uname);
			BoardVO check= boardService.getBoardContent(boardnum);
			if(uname.equals(check.getName())) {
				boardService.deleteBoard(boardnum);
			}
			return "redirect:../list";
		}
	}
	
	@RequestMapping(value="board/update/{boardnum}", method = RequestMethod.GET)
	public String updateContent(@PathVariable int boardnum, HttpSession session, Model model) {
		if(session.getAttribute("id") ==null ) {
			return "redirect: ../../";
		} else {
			BoardVO check= boardService.getBoardContent(boardnum);
			String uname = (String)session.getAttribute("name");
			if(uname.equals(check.getName())) {
				model.addAttribute("board", check);
				return "board/board_update";
			} else {
				return "redirect:../list";
			}
		}
	}
	
	@RequestMapping(value="board/update/", method = RequestMethod.POST)
	public String updateContent(BoardVO board, HttpSession session, Model model) {
		if(session.getAttribute("id") == null) {
			return "redirect: ../../";
		} 
		String uname = (String)(session.getAttribute("name"));
		if(uname.equals(board.getName())) {
			boardService.updateBoard(board);
		}
		return "redirect:../list";
	}
}
