package com.oracle.BlockBuster.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SHReviewModel {
	
	//review
	private int r_no;
	private int pno;
	private String id;
	private String title;
	private String r_title;
	private String r_content;
	private Timestamp r_date;
	private String r_img;
	private int r_hit;
	
	//조회용
	private String nickName;
	private int start;
	private int end;
	private int commentCnt;
	private int totalGood;
	private int good;

}
