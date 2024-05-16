package com.mycompany.codebrew.dto;

import lombok.Data;

@Data
public class Pager {
   private int totalRows;      //페이징 대상이 되는 전체 행수
   private int totalPageNo;   //전체 페이지 수
   private int totalGroupNo;   //전체 그룹 수
   private int startPageNo;   //그룹의 시작 페이지 번호
   private int endPageNo;      //그룹의 끝 페이지 번호
   private int pageNo;         //현재 페이지 번호
   private int pagesPerGroup;   //그룹당 페이지 수
   private int groupNo;      //현재 그룹 번호
   private int rowsPerPage;   //페이지당 행 수 
   private int startRowNo;      //페이지의 시작 행 번호(1, ..., n)
   private int startRowIndex;   //페이지의 시작 행 인덱스(0, ..., n-1) for mysql
   private int endRowNo;      //페이지의 마지막 행 번호
   private int endRowIndex;   //페이지의 마지막 행 인덱스
   private String searchText; //Board 검색어 -> xml 파일 매개변수 1개만 넘기기 위해서 여기에 필드 추가함
   private String acId; 	  // 마이페이지에서 acId를 사용해서 자기 자신의 게시글 목록 조회 하려고
   
   public Pager(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
      this.rowsPerPage = rowsPerPage;
      this.pagesPerGroup = pagesPerGroup;
      this.totalRows = totalRows;
      this.pageNo = pageNo;

      totalPageNo = totalRows / rowsPerPage;
      if(totalRows % rowsPerPage != 0) totalPageNo++;
      
      totalGroupNo = totalPageNo / pagesPerGroup;
      if(totalPageNo % pagesPerGroup != 0) totalGroupNo++;
      
      groupNo = (pageNo - 1) / pagesPerGroup + 1;
      
      startPageNo = (groupNo-1) * pagesPerGroup + 1;
      
      endPageNo = startPageNo + pagesPerGroup - 1;
      if(groupNo == totalGroupNo) endPageNo = totalPageNo;
      
      startRowNo = (pageNo - 1) * rowsPerPage + 1;
      startRowIndex = startRowNo - 1;
      endRowNo = pageNo * rowsPerPage;
      endRowIndex = endRowNo - 1; 
   }
}
