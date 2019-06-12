package com.spring.myapp.aop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.myapp.aop.service.IHelloService;

@Controller
public class HelloController {

	@Autowired
	IHelloService helloservice;
	
	public void hello(String name) {
		System.out.println("HelloController : "+helloservice.sayHello(name));
	}
	
	public void goodbye(String name) {
		System.out.println("HelloController : "+helloservice.sayGoodBye(name));
	}
}
