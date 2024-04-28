package com.mycompany.codebrew.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
	private int caId;
	private int acId;
	private int pdId;
	private int caPdCount;
}
