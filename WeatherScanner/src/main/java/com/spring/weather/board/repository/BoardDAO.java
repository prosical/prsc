package com.spring.weather.board.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.commons.paging.Criteria;
import com.spring.weather.commons.paging.SearchCriteria;

@Repository
public class BoardDAO implements IBoardDAO {


	private final SqlSession sqlSession;
	
	private static final String NAMESPACE = "BoardMapper";
	
	@Autowired
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insert(BoardVO article) throws Exception {
		sqlSession.insert(NAMESPACE+".insert", article);
	}

	@Override
	public BoardVO getArticle(int boardNo) throws Exception {
		System.out.println("게시글 번호: " + boardNo);
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
			
		return sqlSession.selectList(NAMESPACE+".listPaging", cri);
	}
	
	@Override
	public int countArticles() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticles");
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
		System.out.println("원본 글 번호: " + boardNo);
		datas.put("boardNo", boardNo);
		datas.put("count", count);
		sqlSession.update(NAMESPACE+".updateReplyCnt", datas);
	}

	@Override
	public void deleteAll(String memberId) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteAll", memberId);
	}

	@Override
	public int countLike(int boardNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countLike", boardNo);
	}
	
	@Override
	public void deleteViewCnt(int boardNo) throws Exception {
		sqlSession.update(NAMESPACE+".deleteViewCnt", boardNo);
	}

	//--------------------------mypage----------------------------------------    
	
//	@Override
//	public List<BoardVO> getMyArticle(SearchCriteria cri) throws Exception {
//		
//
//		return sqlSession.selectList(NAMESPACE+".getMyArticle");
//	}
//
	@Override
	public List<BoardVO> getLiArticle(SearchCriteria cri) throws Exception {
		

		return sqlSession.selectList(NAMESPACE+".getLiArticle");
	}
//
//	@Override
//	public int countMyArticle(SearchCriteria cri) throws Exception {
//	
//		return sqlSession.selectOne(NAMESPACE + ".countMyArticle");
//	
//	}

	@Override
	public int countLiArticle() throws Exception {
	
		return sqlSession.selectOne(NAMESPACE + ".countLiArticle");
	}

	@Override
	public List<BoardVO> memberWriteAllArticles(String memberId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".memberWriteAllArticles", memberId);
	}

	
	
}