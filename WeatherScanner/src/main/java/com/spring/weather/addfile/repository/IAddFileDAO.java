package com.spring.weather.addfile.repository;

import com.spring.weather.addfile.model.AddFileVO;

public interface IAddFileDAO {
	
	void insertFile(AddFileVO file) throws Exception;
	void deleteFile(int fileNo) throws Exception;
	void deleteFileAll(int boardNo) throws Exception;
	void updateFile(AddFileVO file) throws Exception;
	
	//최대 게시글 번호 조회 기능
	int selectMaxArticleNo();
	
	AddFileVO selectFile(int boardNo) throws Exception;
	int countFile(int boardNo) throws Exception;
}
