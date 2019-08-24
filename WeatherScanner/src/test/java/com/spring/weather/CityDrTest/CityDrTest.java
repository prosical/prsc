package com.spring.weather.CityDrTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.weather.citydr.model.CityDrVO;
import com.spring.weather.citydr.repository.ICityDrDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/root-context.xml"})
public class CityDrTest {

	@Autowired
	private ICityDrDAO dao;
	
	
	@Test
	public void insertTest() throws Exception {
		
		for(int i=0; i<11;i++) {
			
			CityDrVO city = new CityDrVO();

			city.setCityName("도시이름"+i);
			city.setCityInfo("도시설명"+i);
		
			dao.insertCity(city);
			
			System.out.println(city+"입력성공");
		}
		
	}
	
	@Test
	public void updateTest() throws Exception {
		
		CityDrVO vo = new CityDrVO();

		vo.setCityName("도시이름10");
		vo.setCityInfo("도시설명수정");
		
		dao.updateCity(vo);
		
		System.out.println(vo+"수정성공");
		
	}
	
	@Test
	public void selectTest() throws Exception {
		
		String cityName = "도시이름10";
		
		System.out.println(dao.CityInfo(cityName));
	}
	
	@Test
	public void deleteTest() throws Exception {
		
		String cityName = "도시이름10";
		
		dao.deleteCity(cityName);
		
	}
}
