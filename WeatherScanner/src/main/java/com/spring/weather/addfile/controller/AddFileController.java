package com.spring.weather.addfile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.weather.addfile.service.AddFileService;

@RestController
@RequestMapping("/file")
public class AddFileController {

	@Autowired
	private AddFileService service;
	
	@DeleteMapping("/delete/{fileNo}")
	public String deleteFile(@PathVariable int fileNo) throws Exception {
		
		service.deleteFile(fileNo);
		
		return "delSuccess";
	}
	
}
