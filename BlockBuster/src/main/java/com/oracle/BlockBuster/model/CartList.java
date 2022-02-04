package com.oracle.BlockBuster.model;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
public class CartList {

	private String id; //아이디
	private int pno; //품번
	private int no; //순번
	private String title; //영상제목
	private int count; //수량
	private int price; //가격
	
	//상품정보 갖고 카트로 감
//	private int pno;
//	private String title;
//	private int price;
	private String p_img; //상품 사진
}
