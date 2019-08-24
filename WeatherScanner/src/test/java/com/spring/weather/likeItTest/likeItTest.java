package com.spring.weather.likeItTest;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.weather.likeit.model.LikeitVO;
import com.spring.weather.likeit.repository.ILikeitDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/root-context.xml"})
public class likeItTest {

	@Autowired
	private ILikeitDAO dao;


	@Test
	public void insertTest() throws Exception {

		LikeitVO like = new LikeitVO();

		like.setBoardNo(1);
		like.setMemberId("aaa1234");
	
		if(dao.isDuplicate(like) == 0) {
			like.setLikeCnt(dao.countLike(like.getBoardNo()));
			dao.insertLike(like);
			dao.pluslikeCnt(like.getBoardNo());
			System.out.println(like+"성공");
		} else {
			System.out.println("잘못된 요청");
		}
	}

	@Test
	public void deleteTest() throws Exception {
		
		LikeitVO vo = new LikeitVO();
		String memberId = "abc1234";
		int boardNo = 2;
		
		vo.setMemberId(memberId);
		vo.setBoardNo(boardNo);
		
		if(dao.isDuplicate(vo) !=0) {
			dao.deleteLike(vo);
			System.out.println("삭제완료");
		} else {
			System.out.println("검사성공");
		}
	}

	@Test
	public void isDuplicateTest() throws Exception {
		int boardNo = 2;
		String memberId = "abc1234";
		
		LikeitVO vo = new LikeitVO();
		vo.setBoardNo(boardNo);
		vo.setMemberId(memberId);
		
		int result = dao.isDuplicate(vo);
		System.out.println(result);
	}
	
	
	

}
