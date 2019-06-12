package com.spring.myapp.tx.main;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.myapp.tx.service.ITXService;
import com.spring.myapp.tx.service.TXService;

public class TXMain {

	public static void main(String[] args) {

		String path = 
				"file:src/main/webapp/WEB-INF/spring/root-*.xml"; 

		GenericXmlApplicationContext context =
				new GenericXmlApplicationContext(path);
		
		ITXService service = context.getBean("TXService", ITXService.class);
		service.insertTx("abcedfg55555");
		
		context.close();
	}

}
