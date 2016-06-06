package com.kl.napchen.store.inter;

import java.util.List;
import java.util.Map;

import com.kl.napchen.store.bean.User;

public interface IUser {

	public Boolean add(User user);

	public void delete(User user);
	
	public void deleteById(long id);

	public void update(User user);

	public User getUserById(long id);

	public User getUserByUid(String uid);

	public List<User> getUserByCondition(String hql, Map<String, Object> params);

	public List<User> getUserByCondition(String hql,
			Map<String, Object> params, int page, int row);

	public List<User> getUserAll();

	public long count();

	public Long count(String hql, Map<String, Object> params);

	public Long count(String hql, Map<String, Object> params, int page, int row);

	public User login(User user);
	
	public Integer getNxetUid();

	public User checkUnique(User user);
}
