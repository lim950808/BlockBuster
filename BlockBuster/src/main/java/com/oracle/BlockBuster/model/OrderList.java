package com.oracle.BlockBuster.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderList {

	private String orderId;
	private String id;
	private int totalPrice;
	private Date p_date;
	
	private int orderDetailsNum;
	private int pno;
	
	private String title;
	private String p_img;
	private int price;
	private String p_video;
}
