package com.spring.myapp.tx.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.myapp.tx.dao.ITXDAO;

@Service
	public class TXService implements ITXService {

	@Autowired
	ITXDAO txdao;
	
	@Transactional("txManager")
	public void insertTx(String str) {
		txdao.insertStr30(str);
		txdao.insertStr10(str);
	}
	

}
