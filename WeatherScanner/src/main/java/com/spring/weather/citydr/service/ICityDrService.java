package com.spring.weather.citydr.service;

import java.util.List;

import com.spring.weather.board.model.BoardVO;
import com.spring.weather.citydr.model.CityDrVO;
public interface ICityDrService {

	public void insertCity(CityDrVO city) throws Exception;
	public void updateCity(CityDrVO city) throws Exception;
	public CityDrVO CityInfo(String cityName) throws Exception;
	public void deleteCity(String cityName) throws Exception;
	
	public List<BoardVO> getCityReview(String cityName) throws Exception;
}
