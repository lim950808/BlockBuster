package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVo {
	//API 리스트용
	private String cat_name;
	private String gen_name;
	private String title;
	private int year;
	private String country;
	private String casting;
	private String director;
}
