package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PdtSearchVo {
	private String keyword; // 카테고리 검색창의 검색어
	private String category; //카테고리 번호
	private String genre; // 장르 번호
	
}
