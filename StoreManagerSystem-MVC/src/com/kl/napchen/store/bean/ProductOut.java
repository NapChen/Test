package com.kl.napchen.store.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import com.kl.napchen.store.identity.IdEntity;

@SuppressWarnings("serial")
public class ProductOut extends IdEntity implements Serializable {

	private String uid;// 商品唯一标识
	private String name;// 名称
	private String supplier;// 供应商
	private String largeType;// 类别：大类
	private String mediumType;// 类别：中类
	private String smallType;// 类别：小类
	private String version;// 型号
	private String level;// 等级
	private String description;// 描述
	private Double price;// 进价
	private Double salePrice;// 售价
	private Double discount;// 折扣
	private Double finalPrice;// 最终价格，出库价格
	private String storeFlag;// 储存状态：1-在库，0-出库（出售）
	private Integer number;// 数量，默认为1
	private String operatorName;// 操作员
	private String operatorUid;// 操作员唯一标识符
	private Timestamp outTime;// 出库时间
	private String remark;// 备注

	public ProductOut() {
		super();
	}

	public ProductOut(String uid, String name, String supplier,
			String largeType, String mediumType, String smallType,
			String version, String description, Double price, Double salePrice,
			Double discount, Double finalPrice, String level, String storeFlag,
			Integer number, String operatorName, String operatorUid,
			Timestamp outTime, String remark) {
		super();
		this.uid = uid;
		this.name = name;
		this.supplier = supplier;
		this.largeType = largeType;
		this.mediumType = mediumType;
		this.smallType = smallType;
		this.version = version;
		this.description = description;
		this.price = price;
		this.salePrice = salePrice;
		this.discount = discount;
		this.finalPrice = finalPrice;
		this.level = level;
		this.storeFlag = storeFlag;
		this.number = number;
		this.operatorName = operatorName;
		this.operatorUid = operatorUid;
		this.outTime = outTime;
		this.remark = remark;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
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

	public String getSmallType() {
		return smallType;
	}

	public void setSmallType(String smallType) {
		this.smallType = smallType;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(Double finalPrice) {
		this.finalPrice = finalPrice;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getStoreFlag() {
		return storeFlag;
	}

	public void setStoreFlag(String storeFlag) {
		this.storeFlag = storeFlag;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public String getOperatorUid() {
		return operatorUid;
	}

	public void setOperatorUid(String operatorUid) {
		this.operatorUid = operatorUid;
	}

	public Timestamp getOutTime() {
		return outTime;
	}

	public void setOutTime(Timestamp outTime) {
		this.outTime = outTime;
	}
}
