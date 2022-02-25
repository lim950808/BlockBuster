package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product {
	
	//PRODUCT테이블 칼럼
	private int pno;				//품번
	private int category;			//대분류(카테고리)
	private int genre; 				//소분류(장르)
	private String title;			//영상제목
	private int year;				//제작연도
	private String country;			//제작국가
	private String director;		//제작진
	private String casting;			//출연진
	private String description;		//줄거리
	private int price;				//개별 가격
	private String p_img;			//이미지 url
	private String p_video;			//동영상 url
	
	

	//장르 조인용
	private String cat_name;		//카테고리 이름
	private String gen_name;		//장르 이름
	
	//paging
	private int start;				//페이징 시작			
	private int end;				//페이징 끝

	//카테고리별 분류: 1차, 2차
	private int level;
	

	//카트에 중복담기 금지
	private String id;
	
}