package com.spring.weather.location.repository;

import java.util.List;

import com.spring.weather.commons.paging.SearchCriteria;
import com.spring.weather.location.model.LocationVO;

public interface ILocationDAO {
	
	void insertLocation(LocationVO city) throws Exception;
	void deleteLocation(int cityNo) throws Exception;
	void updateLocation(LocationVO city) throws Exception;
	//선택한 달의 여행지 랜덤으로 3개 불러오기
	List<LocationVO> MonthLocation(int month) throws Exception;
	//이미지 파일 삭제
	void deleteImg(int cityNo) throws Exception;
	//여행지 정보 상세보기
	LocationVO getDetailCity(int cityNo) throws Exception;
	
	
	//////////////////////////관리자 페이지
	
	//관리자 페이지용 모든 데이터 호출
	List<LocationVO> adminLoca() throws Exception;
	//페이징 처리용
	int countSearchArticles(SearchCriteria cri) throws Exception;
}
