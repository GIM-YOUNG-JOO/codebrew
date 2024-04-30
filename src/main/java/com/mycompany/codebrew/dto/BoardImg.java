package com.mycompany.codebrew.dto;

import java.sql.Blob;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardImg {

	private int biId;
	private int boId;
	private Blob biFile;
	
}
