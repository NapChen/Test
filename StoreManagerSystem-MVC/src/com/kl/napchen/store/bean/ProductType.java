package com.kl.napchen.store.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import com.kl.napchen.store.identity.IdEntity;

@SuppressWarnings("serial")
public class ProductType extends IdEntity implements Serializable {
	private String type;// 类型-L大类，M-中类，S-小类
	private String largeName;// 大类名
	private String mediumName;// 中类名
	private String smallName;// 小类名
	private String largeType;// 大类编号
	private String mediumType;// 中类编号
	private String smallType;// 小类编号
	private Timestamp createTime;// 创建时间

	public ProductType() {
		super();
	}

	public ProductType(String type, String largeName, String mediumName,
			String smallName, String largeType, String mediumType,
			String smallType, Timestamp createTime) {
		super();
		this.type = type;
		this.largeName = largeName;
		this.mediumName = mediumName;
		this.smallName = smallName;
		this.largeType = largeType;
		this.mediumType = mediumType;
		this.smallType = smallType;
		this.createTime = createTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLargeName() {
		return largeName;
	}

	public void setLargeName(String largeName) {
		this.largeName = largeName;
	}

	public String getMediumName() {
		return mediumName;
	}

	public void setMediumName(String mediumName) {
		this.mediumName = mediumName;
	}

	public String getLargeType() {
		return largeType;
	}

	public void setLargeType(String largeType) {
		this.largeType = largeType;
	}

	public String getMediumType() {
		return mediumType;
	}

	public void setMediumType(String mediumType) {
		this.mediumType = mediumType;
	}

	public String getSmallName() {
		return smallName;
	}

	public void setSmallName(String smallName) {
		this.smallName = smallName;
	}

	public String getSmallType() {
		return smallType;
	}

	public void setSmallType(String smallType) {
		this.smallType = smallType;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}
