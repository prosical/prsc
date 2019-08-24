package com.spring.weather.api.service;

import com.spring.weather.api.model.ApiVO;

public interface IApiService {	
	
	ApiVO getLatLon(String city);	
}
