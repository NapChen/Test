package com.kl.napchen.store.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import com.kl.napchen.store.identity.IdEntity;

@SuppressWarnings("serial")
public class User extends IdEntity implements Serializable {
	private String uid;// 用户唯一标识符
	private String nickName;// 昵称
	private String name;// 姓名
	private String password;// 密码
	private Integer age;// 年龄
	private String email;// 邮箱
	private Integer sex;// 性别
	private Timestamp createTime;// 注册时间

	private Integer permitIn;// 入库权限
	private Integer permitOut;// 出库（出售）权限
	private Integer permitQuery;// 查询履历权限
	private Integer permitAddProduct;// 新增物品权限
	private Integer permitAddType;// 新增类型权限
	private Integer permitAdmin;// 管理员权限

	public User() {
		super();
	}

	public User(String uid, String nickName, String name, String password,
			Integer age, String email, Integer sex, Timestamp createTime,
			Integer permitIn, Integer permitOut, Integer permitQuery,
			Integer permitAddProduct, Integer permitAddType, Integer permitAdmin) {
		super();
		this.uid = uid;
		this.nickName = nickName;
		this.name = name;
		this.password = password;
		this.age = age;
		this.email = email;
		this.sex = sex;
		this.createTime = createTime;
		this.permitIn = permitIn;
		this.permitOut = permitOut;
		this.permitQuery = permitQuery;
		this.permitAddProduct = permitAddProduct;
		this.permitAddType = permitAddType;
		this.permitAdmin = permitAdmin;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Integer getPermitIn() {
		return permitIn;
	}

	public void setPermitIn(Integer permitIn) {
		this.permitIn = permitIn;
	}

	public Integer getPermitOut() {
		return permitOut;
	}

	public void setPermitOut(Integer permitOut) {
		this.permitOut = permitOut;
	}

	public Integer getPermitQuery() {
		return permitQuery;
	}

	public void setPermitQuery(Integer permitQuery) {
		this.permitQuery = permitQuery;
	}

	public Integer getPermitAddProduct() {
		return permitAddProduct;
	}

	public void setPermitAddProduct(Integer permitAddProduct) {
		this.permitAddProduct = permitAddProduct;
	}

	public Integer getPermitAddType() {
		return permitAddType;
	}

	public void setPermitAddType(Integer permitAddType) {
		this.permitAddType = permitAddType;
	}

	public Integer getPermitAdmin() {
		return permitAdmin;
	}

	public void setPermitAdmin(Integer permitAdmin) {
		this.permitAdmin = permitAdmin;
	}

}
