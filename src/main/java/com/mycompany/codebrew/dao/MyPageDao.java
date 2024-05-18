package com.mycompany.codebrew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.BoardComment;
import com.mycompany.codebrew.dto.Pager;

@Mapper
public interface MyPageDao {

	public List<Board> selectMyboard(Pager pager);

	public int count(String acId);
	
	public int boardCommentCount(String acId);

	public void updateAccount(Account account);

	public List<BoardComment> selectMyboardComment(Pager pager);
}
