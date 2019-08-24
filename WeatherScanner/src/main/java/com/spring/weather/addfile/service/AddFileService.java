package com.spring.weather.addfile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.weather.addfile.model.AddFileVO;
import com.spring.weather.addfile.repository.IAddFileDAO;

@Service
public class AddFileService implements IAddFileService {

	@Autowired
	private IAddFileDAO dao;
	
	@Override
	public void insertFile(AddFileVO file) throws Exception {
		dao.insertFile(file);
	}

	@Override
	public void deleteFile(int fileNo) throws Exception {
		dao.deleteFile(fileNo);
	}

//	@Override
//	public void updateFile(AddFileVO file) throws Exception {
//		dao.updateFile(file);
//	}

	@Override
	public int selectMaxArticleNo() {
		return dao.selectMaxArticleNo();
	}

	@Override
	public AddFileVO selectFile(int boardNo) throws Exception {
		return dao.selectFile(boardNo);
	}

	@Override
	public int countFile(int boardNo) throws Exception {
		return dao.countFile(boardNo);
	}

}
