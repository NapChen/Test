package com.kl.napchen.store.inter;

import java.util.List;
import java.util.Map;

import com.kl.napchen.store.bean.ProductType;

public interface IProductType {
	public Boolean add(ProductType productType);

	public void delete(ProductType productType);

	public void deleteById(long id);

	public void update(ProductType productType);

	public ProductType getProductTypeById(long id);


	public List<ProductType> getProductTypeByCondition(String hql,
			Map<String, Object> params);

	public List<ProductType> getProductTypeByCondition(String hql,
			Map<String, Object> params, int page, int row);

	public List<ProductType> getProductTypeAll();

	public long count();

	public Long count(String hql, Map<String, Object> params);

	public Long count(String hql, Map<String, Object> params, int page, int row);

	public ProductType checkUnique(ProductType productType);
	
	public String getNextLargeTypeNo();
	
	public String getNextMediumTypeNo(String largeTypeNo);
	
	public String getNextSmallTypeNo(String largeTypeNo,String mediumTypeNo);
	
	public int executeHql(String hql, Map<String, Object> params);
	
	public int executeHql(String hql);
	
	public int executeSql(String sql);
	
	public int executeSql(String sql, Map<String, Object> params);
}
