package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SHGoodModel {
	
	private int r_no;
	private String id;
	private int good;
	
	//조회용
	private int start;
	private int end;
	
}
