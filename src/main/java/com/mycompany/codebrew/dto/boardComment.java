package com.mycompany.codebrew.dto;

import java.sql.Clob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class boardComment {

	private int bocId;
	private int boId;
	private Clob bocContents;
	private Date bocDate;
	private Date bocNewdate;
	
}
