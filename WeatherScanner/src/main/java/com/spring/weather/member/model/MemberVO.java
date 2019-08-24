package com.spring.weather.member.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String memberId;
	private String memberPw;
	private String nickname;
	private String email;
	private Date regDate;
	private String sessionId;
	private Date sessionLimit;
	private boolean triggerAd;
}
