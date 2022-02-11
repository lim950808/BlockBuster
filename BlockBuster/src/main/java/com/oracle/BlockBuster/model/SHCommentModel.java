package com.oracle.BlockBuster.model;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SHCommentModel {

	private int r_no;
	private int cno;
	private String id;
	private String c_content;
	private Timestamp c_date;
	
	
	//조회용
	private String nickName;
	private int start;
	private int end;
	
	
}
