package com.mycompany.codebrew.dto;

import java.sql.Clob;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {

	private int bocId;
	private int boId;
	private Clob bocContents;
	private Date bocDate;
	private Date bocNewdate;
	private int bocLike;
	private String acId;
}
