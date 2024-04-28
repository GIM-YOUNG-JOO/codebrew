package com.mycompany.codebrew.dto;

import java.sql.Blob;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class boarding {

	private int biId;
	private int boId;
	private Blob bifile;
	
}
