package com.mycompany.codebrew.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.codebrew.dto.Board;
import com.mycompany.codebrew.dto.Pager;

@Mapper
public interface BoardDao {
	public int insert(Board board);
	// 리턴 값은 void가 아니고 int로 변경하는 게 좋음

	public int count();

	public List<Board> selectByPage(Pager pager);

	public List<Board> selectByDate(Pager pager);

	public List<Board> selectByHitcount();

	public List<Board> selectByLike();

	public List<Board> selectByTitle(Pager pager);

	public List<Board> selectByDateWithTitle(Pager pager);

	public List<Board> selectByHitcountWithTitle(String searchText);

	public List<Board> selectByLikeWithTitle(String searchText);
}
