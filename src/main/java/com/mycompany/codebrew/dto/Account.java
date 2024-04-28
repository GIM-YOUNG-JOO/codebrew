package com.mycompany.codebrew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Account {
	private int acId;
	private String acPassword;
	private String acName;
	private String acTel;
	private String acEmail;
	private Boolean acrole;
}
