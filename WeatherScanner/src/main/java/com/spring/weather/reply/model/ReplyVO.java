package com.spring.weather.reply.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int replyNo;
	private int boardNo;
	private String replyContent;
	private String replyWriter;
	private Date regDate;
	private Date updateDate;
}
