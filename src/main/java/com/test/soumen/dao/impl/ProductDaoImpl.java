package com.test.soumen.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.test.soumen.dao.ProductDao;
import com.test.soumen.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	
	@Override
	public Product saveProductDetails(Product product) {
		String insertSql = "insert into product( product_name, product_type, product_price) VALUES(?,?,?)";

		jdbcTemplate.update(insertSql, new Object[]{product.getName(),
													product.getType(), product.getPrice()});

		return product;
	}
	
	@Override
	public List<Product> getProductDetails(Product product) {
		StringBuffer sql = new StringBuffer("SELECT product_id, product_name,"+
											" CASE WHEN product_type='calc' THEN 'Calculator' when product_type='mobile' THEN 'Mobile' "+
											" when product_type='tech' THEN 'Technology' ELSE product_type END  AS product_type , product_price FROM product  ");
		Object[] obj=null;
		
		if(product!=null && !"all".equalsIgnoreCase(product.getType())){
			sql.append("where product_type=?") ;
			obj=new Object[]{product.getType()};
		}
		sql.append(" order by product_type");
		
		return jdbcTemplate.query(sql.toString(), obj, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rownumber) throws SQLException {
				Product e = new Product();
				e.setId(rs.getInt("product_id"));
				e.setName(rs.getString("product_name"));
				e.setType(rs.getString("product_type"));
				e.setPrice(rs.getFloat("product_price"));
				return e;
			}
		});

	}


	@Override
	public void deleteProductDetails(String id) {
		String delSql = "delete from product where product_id=?";
		
		jdbcTemplate.update(delSql, new Object[]{id});
	}


}
