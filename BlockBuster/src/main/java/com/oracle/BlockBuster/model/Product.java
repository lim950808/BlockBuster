package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product {
	
	//PRODUCT테이블 칼럼
	private int pno;
	private int category;
	private int genre; //GENRE
	private String title;
	private int year;
	private String country;
	private String director;
	private String description;
	private String p_img;
	private String casting;
	private int price;
	private String p_video;
	
	

	//장르 조인용
	private String cat_name;
	private String gen_name;
	
	//paging
	private int 	start;			private int 	end;

	//카테고리별 분류: 1차, 2차
	private int level;
	

	//카트에 중복담기 금지
	private String id;
}