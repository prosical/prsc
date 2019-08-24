package com.spring.weather.location.model;

import lombok.Data;

@Data
public class LocationVO {

	private int cityNo;
	private String cityName;
	private String cityMonth;
	private String title;
	private String content;
	private String cityImg;
	
	public int getCityNo() {
		return cityNo;
	}
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getCityMonth() {
		return cityMonth;
	}
	public void setCityMonth(String cityMonth) {
		this.cityMonth = cityMonth;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCityImg() {
		return cityImg;
	}
	public void setCityImg(String cityImg) {
		this.cityImg = cityImg;
	}
	@Override
	public String toString() {
		return "LocationVO [cityNo=" + cityNo + ", cityName=" + cityName + ", cityMonth=" + cityMonth + ", title="
				+ title + ", content=" + content + ", cityImg=" + cityImg + "]";
	}
	
	
	
}
