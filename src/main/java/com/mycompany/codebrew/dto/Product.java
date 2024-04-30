package com.mycompany.codebrew.dto;

import java.sql.Blob;
import java.sql.Clob;

import lombok.Data;

@Data
public class Product {
	private int prid;
	private String prname;
	private int pcid;
	private int prprice;
	private Clob prinfo;
	private Clob prmemo;
	private Blob primage;
}
