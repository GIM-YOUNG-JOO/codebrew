package com.mycompany.codebrew.dto;

import lombok.Data;

@Data
public class Account {
	private String acId;
	private String acPassword;
	private String acName;
	private String acTel;
	private String acEmail;
	private String acRole;
	
	//비밀번호 수정을 위한 필드 선언
	private String acPasswordCheck;
}
