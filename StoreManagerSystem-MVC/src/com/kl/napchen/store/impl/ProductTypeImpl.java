package com.kl.napchen.store.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kl.napchen.store.bean.ProductType;
import com.kl.napchen.store.dao.ProductTypeDao;
import com.kl.napchen.store.inter.IProductType;

public class ProductTypeImpl implements IProductType {
	@Autowired
	private ProductTypeDao productTypeDAO;

	@Override
	public Boolean add(ProductType productType) {
		// 检查昵称是否已经存在
		if (this.checkUnique(productType) != null) {
			return false;
		}

		// 注册时间
		productType.setCreateTime(new Timestamp(System.currentTimeMillis()));
		productTypeDAO.save(productType);
		// 保存成功
		return true;
	}

	@Override
	public void delete(ProductType productType) {
		productTypeDAO.delete(productType);
	}

	@Override
	public void deleteById(long id) {
		ProductType productType = productTypeDAO.get(ProductType.class, id);
		this.delete(productType);
	}

	@Override
	public void update(ProductType productType) {
		productTypeDAO.update(productType);
	}

	@Override
	public ProductType getProductTypeById(long id) {
		return productTypeDAO.get(ProductType.class, id);
	}

	@Override
	public List<ProductType> getProductTypeByCondition(String hql,
			Map<String, Object> params) {
		return productTypeDAO.find(hql, params);
	}

	@Override
	public List<ProductType> getProductTypeByCondition(String hql,
			Map<String, Object> params, int page, int row) {
		return productTypeDAO.find(hql, params, page, row);
	}

	@Override
	public List<ProductType> getProductTypeAll() {
		String hql = " FROM ProductType ";
		return productTypeDAO.find(hql);
	}

	@Override
	public long count() {
		String hql = " select count(*) from ProductType u ";
		return productTypeDAO.count(hql);
	}

	@Override
	public Long count(String hql, Map<String, Object> params) {
		return productTypeDAO.count(hql, params);
	}

	@Override
	public Long count(String hql, Map<String, Object> params, int page, int row) {
		return productTypeDAO.count(hql, params, page, row);
	}

	@Override
	public ProductType checkUnique(ProductType productType) {

		return null;
	}

	@Override
	public String getNextLargeTypeNo() {
		String hql = "FROM ProductType p WHERE p.type = 'L' ORDER BY p.largeType DESC";
		List<ProductType> list = productTypeDAO.find(hql);
		if (list.size() != 0) {
			return (1 + Integer.parseInt(list.get(0).getLargeType())) + "";
		}
		return "100001";
	}

	@Override
	public String getNextMediumTypeNo(String largeTypeNo) {
		String hql = " FROM ProductType p " + //
				" WHERE p.largeType = :largeType " + //
				" AND p.type = 'M' " + //
				" ORDER BY p.mediumType DESC ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("largeType", largeTypeNo);
		List<ProductType> list = productTypeDAO.find(hql, params);
		if (list.size() != 0) {
			String mediumType = list.get(0).getMediumType();
			// 取后七位
			String mediumTypeShort = mediumType.substring(6);

			System.out.println(mediumType + "---" + mediumTypeShort);

			// 拼接加一并返回
			return mediumType.substring(0, 6)
					+ String.format("%06d",
							(1 + Integer.parseInt(mediumTypeShort)));
		}
		return largeTypeNo + "000001";
	}

	@Override
	public String getNextSmallTypeNo(String largeTypeNo, String mediumTypeNo) {
		String hql = " FROM ProductType p " + //
				" WHERE p.largeType = :largeType " + //
				" AND p.mediumType = :mediumType " + //
				" AND p.type = 'S' " + //
				" ORDER BY p.smallType DESC ";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("largeType", largeTypeNo);
		params.put("mediumType", mediumTypeNo);
		List<ProductType> list = productTypeDAO.find(hql, params);
		System.out.println("size:" + list.size());
		if (list.size() != 0) {
			String smallType = list.get(0).getSmallType();
			System.out.println(smallType);
			// 取后七位
			String smallTypeShort = smallType.substring(12);
			// 拼接加一并返回
			return smallType.substring(0, 12)
					+ String.format("%06d",
							(1 + Integer.parseInt(smallTypeShort)));
		}
		return mediumTypeNo + "000001";
	}

	@Override
	public int executeHql(String hql, Map<String, Object> params) {
		return productTypeDAO.executeHql(hql, params);

	}

	@Override
	public int executeHql(String hql) {
		return productTypeDAO.executeHql(hql);
	}

	@Override
	public int executeSql(String sql) {
		return productTypeDAO.executeSql(sql);
	}

	@Override
	public int executeSql(String sql, Map<String, Object> params) {
		return productTypeDAO.executeSql(sql, params);
	}

}
