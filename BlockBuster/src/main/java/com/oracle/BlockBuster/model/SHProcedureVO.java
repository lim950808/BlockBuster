package com.oracle.BlockBuster.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SHProcedureVO {
	
	private int q_no;
	private String q_anonymous;
	private String q_content;
	private Date q_date;
}
