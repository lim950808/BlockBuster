package com.oracle.BlockBuster.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderList {

	private String orderId; 		//주문번호
	private String id; 				//아이디	
	private int totalPrice;			//총 결제금액
	private Date p_date;			//결제일자
	
	private int orderDetailsNum;	//구매 상세페이지 번호
	private int pno;				//품번
	
	private String title;			//영상제목
	private String p_img;			//이미지 url
	private int price;				//개별 가격
	private String p_video;			//비디오 url
	
}
