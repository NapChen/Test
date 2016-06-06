package com.kl.napchen.store.inter;

import java.util.List;
import java.util.Map;

import com.kl.napchen.store.bean.ProductIn;
import com.kl.napchen.store.bean.User;

public interface IProductIn {

	public Boolean add(ProductIn productIn, User user);

	public void delete(ProductIn productIn);

	public void deleteById(long id);

	public void update(ProductIn productIn);

	public ProductIn getProductInById(long id);

	public ProductIn getProductInByUid(String uid);

	public List<ProductIn> getProductInByCondition(String hql,
			Map<String, Object> params);

	public List<ProductIn> getProductInByCondition(String hql,
			Map<String, Object> params, int page, int row);

	public List<ProductIn> getProductInAll();

	public long count();

	public Long count(String hql, Map<String, Object> params);

	public Long count(String hql, Map<String, Object> params, int page, int row);

	public String getNxetUid();

	//返修
	public void repair(ProductIn productIn,String reason);
	//出售
	public void sold(ProductIn productIn);
	//封锁
	public void lockEnable(ProductIn productIn);

}
