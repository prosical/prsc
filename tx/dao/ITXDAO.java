package com.spring.myapp.tx.dao;

import org.apache.ibatis.annotations.Param;

public interface ITXDAO {
	
	void insertStr30(@Param("str") String str);
	void insertStr10(@Param("str") String str);

}
