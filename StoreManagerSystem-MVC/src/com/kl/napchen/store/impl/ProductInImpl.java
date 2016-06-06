package com.kl.napchen.store.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kl.napchen.store.bean.ProductIn;
import com.kl.napchen.store.bean.User;
import com.kl.napchen.store.dao.ProductInDao;
import com.kl.napchen.store.global.GlobalConstant;
import com.kl.napchen.store.inter.IProductIn;

public class ProductInImpl implements IProductIn {
	@Autowired
	private ProductInDao productInDAO;

	@Override
	public Boolean add(ProductIn productIn, User user) {
		productIn.setOperatorName(user.getName());
		productIn.setOperatorUid(user.getUid());
		productInDAO.save(productIn);
		// 保存成功
		return true;
	}

	@Override
	public void delete(ProductIn productIn) {
		productInDAO.delete(productIn);
	}

	@Override
	public void deleteById(long id) {
		ProductIn productIn = productInDAO.get(ProductIn.class, id);
		this.delete(productIn);
	}

	@Override
	public void update(ProductIn productIn) {
		productInDAO.update(productIn);
	}

	@Override
	public ProductIn getProductInById(long id) {
		return productInDAO.get(ProductIn.class, id);
	}

	@Override
	public ProductIn getProductInByUid(String uid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		String hql = " FROM ProductIn u Where u.uid = :uid ";
		return productInDAO.get(hql, params);
	}

	@Override
	public List<ProductIn> getProductInByCondition(String hql,
			Map<String, Object> params) {
		return productInDAO.find(hql, params);
	}

	@Override
	public List<ProductIn> getProductInByCondition(String hql,
			Map<String, Object> params, int page, int row) {
		return productInDAO.find(hql, params, page, row);
	}

	@Override
	public List<ProductIn> getProductInAll() {
		String hql = " FROM ProductIn ";
		return productInDAO.find(hql);
	}

	@Override
	public long count() {
		String hql = " select count(*) from ProductIn u ";
		return productInDAO.count(hql);
	}

	@Override
	public Long count(String hql, Map<String, Object> params) {
		return productInDAO.count(hql, params);
	}

	@Override
	public Long count(String hql, Map<String, Object> params, int page, int row) {
		return productInDAO.count(hql, params, page, row);
	}

	@Override
	public String getNxetUid() {
		String hql = " From ProductIn u Order By u.uid Desc ";
		List<ProductIn> list = productInDAO.find(hql);
		if (list.size() != 0) {
			return (1 + Integer.parseInt(list.get(0).getUid())) + "";
		}
		return "10000001";
	}

	@Override
	public void repair(ProductIn productIn, String reason) {
		// 设置返修信息
		productIn.setRelFlag(GlobalConstant.FLAG_ENABLE);
		productIn.setRelReason(reason);
		productIn.setRelTime(new Timestamp(System.currentTimeMillis()));

		// 返修的同时将对物品进行封锁
		productIn.setHoldFlag(GlobalConstant.FLAG_ENABLE);
		productIn.setHoldReason("");
		productIn.setHoldTime(new Timestamp(System.currentTimeMillis()));

		productInDAO.update(productIn);
	}

	@Override
	public void sold(ProductIn productIn) {

		calCost(productIn);
	}

	@Override
	public void lockEnable(ProductIn productIn) {

	}

	// 计算成本
	private void calCost(ProductIn productIn) {

	}
}
