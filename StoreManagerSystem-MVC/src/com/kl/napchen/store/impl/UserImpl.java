package com.kl.napchen.store.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kl.napchen.store.bean.User;
import com.kl.napchen.store.dao.UserDao;
import com.kl.napchen.store.global.GlobalConstant;
import com.kl.napchen.store.inter.IUser;

public class UserImpl implements IUser {

	@Autowired
	private UserDao userDAO;

	@Override
	public Boolean add(User user) {
		// 检查昵称是否已经存在
		if (this.checkUnique(user) != null) {
			return false;
		}

		// 生成唯一标识符
		user.setUid(this.getNxetUid() + "");
		// 初始化权限，默认不具有
		user.setPermitAddProduct(GlobalConstant.DISABLE);
		user.setPermitAddType(GlobalConstant.DISABLE);
		user.setPermitAdmin(GlobalConstant.DISABLE);
		user.setPermitIn(GlobalConstant.DISABLE);
		user.setPermitOut(GlobalConstant.DISABLE);
		user.setPermitQuery(GlobalConstant.DISABLE);
		// 注册时间
		user.setCreateTime(new Timestamp(System.currentTimeMillis()));
		userDAO.save(user);
		// 保存成功
		return true;
	}

	@Override
	public void delete(User user) {
		userDAO.delete(user);
	}

	@Override
	public void deleteById(long id) {
		User user = userDAO.get(User.class, id);
		this.delete(user);
	}

	@Override
	public void update(User user) {
		userDAO.update(user);
	}

	@Override
	public User getUserById(long id) {
		return userDAO.get(User.class, id);
	}

	@Override
	public User getUserByUid(String uid) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		String hql = " FROM User u Where u.uid = :uid ";
		return userDAO.get(hql, params);
	}

	@Override
	public List<User> getUserByCondition(String hql, Map<String, Object> params) {
		return userDAO.find(hql, params);
	}

	@Override
	public List<User> getUserByCondition(String hql,
			Map<String, Object> params, int page, int row) {
		return userDAO.find(hql, params, page, row);
	}

	@Override
	public List<User> getUserAll() {
		String hql = " FROM User ";
		return userDAO.find(hql);
	}

	@Override
	public long count() {
		String hql = " select count(*) from User u ";
		return userDAO.count(hql);
	}

	@Override
	public Long count(String hql, Map<String, Object> params) {
		return userDAO.count(hql, params);
	}

	@Override
	public Long count(String hql, Map<String, Object> params, int page, int row) {
		return userDAO.count(hql, params, page, row);
	}

	@Override
	public User login(User user) {
		// 采用uid或者昵称登录
		if (user.getPassword() != null
				&& (user.getNickName() != null || user.getUid() != null)) {
			String hql = "";
			Map<String, Object> params = new HashMap<String, Object>();
			// 如果采用昵称登录
			if (user.getNickName() != null) {
				hql = " From User u Where u.nickName = :nickName  And u.password = :password ";
				params.put("nickName", user.getNickName());
			} else if (user.getUid() != null) {// 如果采用UI的登录
				hql = " From User u Where u.uid = :uid  And u.password = :password ";
				params.put("uid", user.getUid());
			}
			params.put("password", user.getPassword());
			return userDAO.get(hql, params);
		}
		return null;
	}

	@Override
	public User checkUnique(User user) {
		if (user.getNickName() != null) {
			String hql = "";
			Map<String, Object> params = new HashMap<String, Object>();
			// 检查昵称是否已经存在
			if (user.getNickName() != null) {
				hql = " From User u Where u.nickName = :nickName ";
				params.put("nickName", user.getNickName());
			}
			return userDAO.get(hql, params);
		}
		return null;
	}

	@Override
	public Integer getNxetUid() {
		String hql = " From User u Order By u.uid Desc ";
		List<User> list = userDAO.find(hql);
		if (list != null) {
			return 1 + Integer.parseInt(list.get(0).getUid());
		}
		return null;
	}

}
