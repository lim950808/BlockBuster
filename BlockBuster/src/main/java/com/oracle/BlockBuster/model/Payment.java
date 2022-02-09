package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Payment {

	private int s_no; //결제 번호
	private String id; //아이디
	private int pno; //품번
	private int totalPrice; //총 결제금액
	private int p_date; //결제 일자
	
	//주문번호
	private String orderNo;
	
	private String paymentCd;
}
