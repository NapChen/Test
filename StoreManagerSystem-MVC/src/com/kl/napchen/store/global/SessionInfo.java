package com.kl.napchen.store.global;

import com.kl.napchen.store.bean.ProductType;
import com.kl.napchen.store.bean.User;

public class SessionInfo {
	private User user;
	private Integer loginFlag;
	private Integer loginInfo;
	private Integer registerFlag;
	private Integer registerInfo;
	private String errorObj;
	private ProductType productType;
	private String pageInfo;
	private String prePageInfo;
	private String operateInfo;
	private Integer permitInfo;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(Integer loginFlag) {
		this.loginFlag = loginFlag;
	}

	public Integer getLoginInfo() {
		return loginInfo;
	}

	public void setLoginInfo(Integer loginInfo) {
		this.loginInfo = loginInfo;
	}

	public Integer getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(Integer registerFlag) {
		this.registerFlag = registerFlag;
	}

	public Integer getRegisterInfo() {
		return registerInfo;
	}

	public void setRegisterInfo(Integer registerInfo) {
		this.registerInfo = registerInfo;
	}

	public String getErrorObj() {
		return errorObj;
	}

	public void setErrorObj(String errorObj) {
		this.errorObj = errorObj;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	public String getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(String pageInfo) {
		this.pageInfo = pageInfo;
	}

	public String getPrePageInfo() {
		return prePageInfo;
	}

	public void setPrePageInfo(String prePageInfo) {
		this.prePageInfo = prePageInfo;
	}

	public String getOperateInfo() {
		return operateInfo;
	}

	public void setOperateInfo(String operateInfo) {
		this.operateInfo = operateInfo;
	}

	public Integer getPermitInfo() {
		return permitInfo;
	}

	public void setPermitInfo(Integer permitInfo) {
		this.permitInfo = permitInfo;
	}

}
