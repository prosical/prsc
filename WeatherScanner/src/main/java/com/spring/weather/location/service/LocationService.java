package com.spring.weather.location.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.location.model.LocationVO;
import com.spring.weather.location.repository.ILocationDAO;

@Service
public class LocationService implements ILocationService {

	@Autowired
	private ILocationDAO dao;
	
	@Override
	public void insertLocation(LocationVO city) throws Exception {
		dao.insertLocation(city);
	}

	@Override
	public void deleteLocation(int cityNo) throws Exception {
		dao.deleteLocation(cityNo);
	}

	@Override
	public void updateLocation(LocationVO city) throws Exception {
		dao.updateLocation(city);
	}

	@Override
	public List<LocationVO> MonthLocation(int month) throws Exception {
		return dao.MonthLocation(month);
	}

	@Override
	public List<LocationVO> adminLoca() throws Exception {
		return dao.adminLoca();
	}

	@Override
	public int countSearchArticles(SearchCriteria cri) throws Exception {
		return dao.countSearchArticles(cri);
	}

	@Override
	public LocationVO getDetailCity(int cityNo) throws Exception {
		return dao.getDetailCity(cityNo);
	}

}
