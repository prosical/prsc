package com.spring.weather.citydr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.board.repository.IBoardDAO;
import com.spring.weather.citydr.model.CityDrVO;
import com.spring.weather.citydr.repository.ICityDrDAO;

@Service
public class CityDrService implements ICityDrService {
	
	@Autowired
	private ICityDrDAO dao;
	@Autowired 
	IBoardDAO reviewdao;

	@Override
	public void insertCity(CityDrVO city) throws Exception {
		dao.insertCity(city);
	}

	@Override
	public void updateCity(CityDrVO city) throws Exception {
		dao.updateCity(city);
	}

	@Override
	public CityDrVO CityInfo(String cityName) throws Exception {
		
		return dao.CityInfo(cityName);
	}
	
	

	@Override
	public void deleteCity(String cityName) throws Exception {
		dao.deleteCity(cityName);
	}

	@Override
	public List<BoardVO> getCityReview(String cityName) throws Exception {
		return dao.getCityReview(cityName);
	}

}
