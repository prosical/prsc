package com.spring.weather.api.repository;

import com.spring.weather.api.model.ApiVO;

public interface IApiDAO {

	// 넘어온 도시로 위도,경도 db에서가져오기
	ApiVO getLatLon(String city);
}
