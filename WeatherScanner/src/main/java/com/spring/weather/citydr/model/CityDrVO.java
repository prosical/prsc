package com.spring.weather.citydr.model;

import lombok.Data;

@Data
public class CityDrVO {

	private String cityName;
	private String cityInfo;
	private String cityDryStart;
	private String cityDryEnd;
	private String cityRainStart;
	private String cityRainEnd;
	private String rcmdMonStart;
	private String rcmdMonEnd;
	
	
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getCityInfo() {
		return cityInfo;
	}
	public void setCityInfo(String cityInfo) {
		this.cityInfo = cityInfo;
	}
	@Override
	public String toString() {
		return "CityDrVO [cityName=" + cityName + ", cityInfo=" + cityInfo + ", getCityName()=" + getCityName()
				+ ", getCityInfo()=" + getCityInfo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
	
}
