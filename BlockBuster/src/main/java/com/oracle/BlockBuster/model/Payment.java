package com.oracle.BlockBuster.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Payment {

	private String orderId; //주문번호 PK
	private String id; //아이디
	//private int pno; //품번
	private int totalPrice; //총 결제금액
	private Date p_date; //결제 일자
	
}
