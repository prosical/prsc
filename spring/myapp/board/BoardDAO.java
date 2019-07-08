package com.spring.myapp.board.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.board.model.BoardVO;
import com.spring.myapp.commons.paging.Criteria;
import com.spring.myapp.commons.paging.SearchCriteria;


//자동 빈 등록 아노테이션: @Component-그외, @Controller, @Service, @Repository-DAO 클래스
@Repository
public class BoardDAO implements IBoardDAO {

	private final SqlSession sqlSession;
	
	private static final String NAMESPACE = "BoardMapper";
	
	//의존성 자동주입 아노테이션: @Autowired-두개일경우 @Qualifier()로 잡아줌, @Inject, @Resources-사용X
	@Autowired
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insert(BoardVO article) throws Exception {
		sqlSession.insert(NAMESPACE+".insert",article);
	}

	@Override
	public BoardVO getArticle(int boardNo) throws Exception {
		System.out.println("게시글 번호: "+boardNo);
		return sqlSession.selectOne(NAMESPACE+".getArticle", boardNo);
	}

	@Override
	public void update(BoardVO article) throws Exception {
		sqlSession.update(NAMESPACE+".update", article);
	}

	@Override
	public void delete(int boardNo) throws Exception {
		sqlSession.delete(NAMESPACE+".delete", boardNo);
		
	}

	@Override
	public List<BoardVO> getAllArticles() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getAllArticles");
	}

	@Override
	public List<BoardVO> listPaging(Criteria cri) throws Exception {
		
		//page변수에 1이 저장되어 있다면? LIMIT절의 시작값은 0
		//         2가 저장되어 있다면? LIMIT절의 시작값은 10
		//페이지 재계산 : (페이지 번호 - 1) * 한페이지당 들어갈 게시물 수
		//page=(page - 1) * 15;
		
		return sqlSession.selectList(NAMESPACE+".listPaging",cri);
	}

	@Override
	public int countArticles() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countArticles");
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listSearch", cri);
	}
	
	@Override
	public int countSearchArticles(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchArticles", cri);
	}
	
	
	@Override
	public void updateViewCnt(int boardNo) throws Exception {
		sqlSession.update(NAMESPACE+".updateViewCnt", boardNo);
	}

	@Override
	public void updateReplyCnt(int boardNo, int count) throws Exception {
		 Map<String, Object> datas = new HashMap<>();
		 datas.put("boardNo", boardNo);
		 datas.put("count", count);
		sqlSession.update(NAMESPACE+".updateReplyCnt", datas);
	}


	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	
	public List<BoardVO> listSearchByTitle(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listSearchByTitle",cri);
	}

	@Override
	public int countSearchedArticles(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchedArticles",cri);
	}

	@Override
	public List<BoardVO> listSearchByWriter(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listSearchByWriter", cri);
	}

	@Override
	public List<BoardVO> listSearchByContent(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listSearchByContent", cri);
	}

	@Override
	public List<BoardVO> listSearchByTitleContent(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listSearchByTitleContent", cri);
	}

	@Override
	public int countSearchedTitleArticles(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchedTitleArticles");
	}

	@Override
	public int countSearchedContentArticles(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchedContentArticles");
	}

	@Override
	public int countSearchedTitleContentArticles(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
