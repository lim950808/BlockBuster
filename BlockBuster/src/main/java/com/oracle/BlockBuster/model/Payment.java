package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Payment {

	private int s_no;
	private String id;
	private int pno;
	private int totalPrice; //총 결제금액
	private int p_date;
	
	//주문번호
	private String orderNo;
	
	private String paymentCd;
}
