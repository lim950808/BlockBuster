package com.oracle.BlockBuster.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {

	private String id; //아이디
	private String nickname; //닉네임
	private String email; //이메일
	private String password; //비밀번호
	private int grade; //관리자 여부
	private int delstatus; //삭제 여부
}
