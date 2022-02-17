package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentDetails {

	private int detailNo; //주문상세 번호 (pk, seq)
	private String orderId; //주문번호
	private int pno; //품번
	
}
