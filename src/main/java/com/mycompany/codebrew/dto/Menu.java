package com.mycompany.codebrew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Menu {
	private int pNo;
	private String pName;
	private String pCategory;
	private String pDescription;
	private String pComment;
}
