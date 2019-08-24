package com.spring.weather.locationTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.weather.location.model.LocationVO;
import com.spring.weather.location.repository.ILocationDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/root-context.xml"})
public class LocationTest {
	
	@Autowired
	private ILocationDAO dao;
	
	@Test
	public void insertTest() throws Exception {
		
		LocationVO city = new LocationVO();
		
		city.setCityName("ttesstddd1");
		city.setCityMonth("1");
		city.setContent("tesfssdt");
		city.setTitle("t");
		
		dao.insertLocation(city);
		
	}
	
	@Test
	public void updateTest() throws Exception {
		
		LocationVO city = new LocationVO();
		
		String title = "TEST";
		String content = "TTTTEEEESSS";
		
		city.setTitle(title);
		city.setContent(content);
		city.setCityNo(1);
		
		dao.updateLocation(city);
	}

	@Test
	public void deleteTest() throws Exception {
		
		int cityNo = 1;
		
		dao.deleteLocation(cityNo);
	}
	
	@Test
	public void selectTest() throws Exception {
		
		int month = 1;
		System.out.println(dao.MonthLocation(month));
	}
}
