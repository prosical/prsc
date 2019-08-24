package com.spring.weather.member.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LoginVO {
	
	private String memberId;
	private String memberPw;
	private boolean autoLogin;

}
