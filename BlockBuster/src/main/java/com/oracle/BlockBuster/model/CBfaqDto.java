package com.oracle.BlockBuster.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CBfaqDto {
	private int 	f_no;
	private String 	id;
	private String 	f_title;
	private String 	f_content;
	private Date 	f_date;
	private int 	f_hit;

	//조회용
	private String search;   private String keyword;
	private String pageNum;
	private int start;       private int end;
}
