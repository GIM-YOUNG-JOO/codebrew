package com.mycompany.codebrew.dao.mybatis;

import org.apache.ibatis.annotations.Mapper;
import com.mycompany.codebrew.dto.Account;

@Mapper
public interface AccountDao {
	public int insert(Account account);
	public Account selectByAcId(String acId);
}
