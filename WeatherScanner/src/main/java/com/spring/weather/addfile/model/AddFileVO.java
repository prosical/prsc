package com.spring.weather.addfile.model;

import lombok.Data;

@Data
public class AddFileVO {
	
	private int fileNo;
	private int boardNo;
	private String fileName;
	private long fileSize;
	private String fileContentType;
	private byte[] fileData;
	
	
}
