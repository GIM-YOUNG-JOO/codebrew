package com.mycompany.codebrew.dao.mybatis;

import java.util.List;
<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/master
import org.apache.ibatis.annotations.Mapper;
<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/master
import com.mycompany.codebrew.dto.Pager;
import com.mycompany.codebrew.dto.Product;

@Mapper
public interface ProductDao {
	public int insert(Product product);
<<<<<<< HEAD
	public int count();
	public List<Product> selectByPage(Pager pager);
=======
	public Product selectByPrId(int prId);
	public List<Product> selectByPage(Pager pager);
	public int count();
>>>>>>> refs/remotes/origin/master
}
