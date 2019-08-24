package com.spring.weather.CityDrTest;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.board.repository.IBoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/root-context.xml"})
public class BoardDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);	
	
	@Inject
	private IBoardDAO boardDAO;
	
	
	@Test
	public void insertTest1() throws Exception {
		
		for (int i = 0; i < 3; i++) {
			logger.info("ddd");
			BoardVO vo = new BoardVO();
			vo.setTitle(i + "번째 게시물");
			vo.setContent(i + "번째 게시물 내용입니다~~");
			vo.setMemberId("abc1234");
			boardDAO.insert(vo);
		}
		
	}
	/*
	//게시물 개별 조회 테스트
	@Test
	public void selectTest() throws Exception{
		logger.info(boardDAO.getArticle(99).toString()+"\n");
	}
	
	//게시물 수정 테스트 : VO의 세터를 사용하여 수정 내용 (글제목, 글내용)을 입력하고
	@Test
	public void updateTest() throws Exception{
		BoardVO article = new BoardVO();
		
		article.setBoardNo(1);
		article.setTitle("글 수정 테스트 제목!!");
		article.setContent("글 수정 테스트 내용!!");
		boardDAO.update(article);
		logger.info(boardDAO.getArticle(1).toString() + "\n");
	}
	
	//게시물 삭제 테스트 : 게시글 번호를 통한 삭제를 확인하세요
	@Test
	public void deleteTest() throws Exception{
		boardDAO.delete(1);
	}
	
	//모든 게시물 조회 테스트
	@Test
	public void selectAllTest() throws Exception{
		
		List<BoardVO> articles = boardDAO.getAllArticles();
		for(BoardVO article : articles) {
			logger.info(article.toString());
		}
		
	}
	*/
	
	
	
	
	
	
	
	
	

}











