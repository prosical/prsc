package com.spring.myapp.aop.main;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.myapp.aop.controller.HelloController;

public class HelloMain {

	public static void main(String[] args) {

		String path = 
				"file:src/main/webapp/WEB-INF/spring/root-*.xml"; 
			
			GenericXmlApplicationContext context =
					new GenericXmlApplicationContext(path);
			HelloController controller = context.getBean("helloController", HelloController.class);
			
			controller.hello("aaa");
			System.out.println();
			controller.goodbye("daf");
			context.close();

	}

}
