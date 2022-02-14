package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SHSearchModel {
	private String search_option;
	private String keyword;
	
	
	//조회용
	private int commentCnt;
	private int good;
	private int start;
	private int end;
}
