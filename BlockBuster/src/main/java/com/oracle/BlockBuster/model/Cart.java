package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cart {

	private String id; //아이디
	private int pno; //품번
	private int no; //장바구니에 넣은 순번
	private String title; //영상제목
	private int count; //수량
	private int price; //가격
	
	private String p_img; //상품 사진
	
	private int num; //장바구니에 desc로 쌓이는 순서
	
}
