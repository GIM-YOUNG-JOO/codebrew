package com.mycompany.codebrew.dto;

import java.sql.Clob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class board {
	
	private int boId;
	private int acId;
	private String boTitle;
	private Clob boContent;
	private Date boDewdate;
	private int boHitcount;
	private int biCd;

}
