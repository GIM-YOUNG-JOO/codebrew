package com.mycompany.codebrew.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.codebrew.dto.Account;
import com.mycompany.codebrew.dto.Pager;

@Mapper
public interface AccountDao {
	public int insert(Account account);
	public Account selectByAcId(String acId);
	public int update(Account account);
	public List<Account> selectByPage(Pager pager);
	public int deleteByAcId(String acId);
	public int count();
	public String selectAcIdByAcTel(Map<String, Object> params);
	
	// 게시판 user, admin 확인 용 DAO
	public String selectRole(String acId);
	public Account selectByAcIdAndAcNameAndAcEmail(Account account);
	public void updatePassword(Account account);
}
