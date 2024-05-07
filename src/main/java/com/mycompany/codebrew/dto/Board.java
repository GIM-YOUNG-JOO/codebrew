package com.mycompany.codebrew.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {
	
	private int boId;
	private String acId;
	private String boTitle;
	private String boContent;
	private Date boDate;
	private Date boNewdate;
	private int boHitcount;
	private int bcId;
	private int boLike;
	private byte[] boAttachdata;
	private MultipartFile boAttach;


}
