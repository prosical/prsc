package com.spring.weather.api.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.weather.api.model.ApiVO;
import com.spring.weather.api.repository.IApiDAO;

@Service
public class ApiService implements IApiService{

	@Autowired
	private IApiDAO apiDAO;

	@Override
	public ApiVO getLatLon(String city) {
		return apiDAO.getLatLon(city);
	}

	
	
}
