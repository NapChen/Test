package com.kl.napchen.store.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import com.kl.napchen.store.identity.IdEntity;

/**
 * @author Nap
 */
@SuppressWarnings("serial")
public class ProductIn extends IdEntity implements Serializable {

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
	private String storeFlag;// 储存状态：1-在库，0-出库（出售）
	private Integer number;// 数量，默认为1
	private String operatorName;// 库操作员
	private String operatorUid;// 库操作员唯一标识符
	private Timestamp inTime;// 入库时间
	private String holdFlag;// 封锁标记
	private String holdReason;// 封锁原因
	private Timestamp holdTime;// 封锁时间
	private String relFlag;// 返修标记
	private String relReason;// 返修原因
	private Timestamp relTime;// 返修时间
	private String repairDoneFlag;// 返修完成标记
	private Timestamp repairDoneTime;// 返修完成时间
	private String remark;// 备注

	public ProductIn() {
		super();
	}

	public ProductIn(String uid, String name, String supplier,
			String largeType, String mediumType, String smallType,
			String version, String description, Double price, Double salePrice,
			Double discount, String level, String storeFlag, Integer number,
			String operatorName, String operatorUid, Timestamp inTime,
			String holdFlag, String holdReason, Timestamp holdTime,
			String relFlag, String relReason, Timestamp relTime,
			String repairDoneFlag, Timestamp repairDoneTime, String remark) {
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
		this.level = level;
		this.storeFlag = storeFlag;
		this.number = number;
		this.operatorName = operatorName;
		this.operatorUid = operatorUid;
		this.inTime = inTime;
		this.holdFlag = holdFlag;
		this.holdReason = holdReason;
		this.holdTime = holdTime;
		this.relFlag = relFlag;
		this.relReason = relReason;
		this.relTime = relTime;
		this.repairDoneFlag = repairDoneFlag;
		this.repairDoneTime = repairDoneTime;
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

	public Timestamp getInTime() {
		return inTime;
	}

	public void setInTime(Timestamp inTime) {
		this.inTime = inTime;
	}

	public String getHoldFlag() {
		return holdFlag;
	}

	public void setHoldFlag(String holdFlag) {
		this.holdFlag = holdFlag;
	}

	public String getHoldReason() {
		return holdReason;
	}

	public void setHoldReason(String holdReason) {
		this.holdReason = holdReason;
	}

	public Timestamp getHoldTime() {
		return holdTime;
	}

	public void setHoldTime(Timestamp holdTime) {
		this.holdTime = holdTime;
	}

	public String getRelFlag() {
		return relFlag;
	}

	public void setRelFlag(String relFlag) {
		this.relFlag = relFlag;
	}

	public String getRelReason() {
		return relReason;
	}

	public void setRelReason(String relReason) {
		this.relReason = relReason;
	}

	public Timestamp getRelTime() {
		return relTime;
	}

	public void setRelTime(Timestamp relTime) {
		this.relTime = relTime;
	}

	public String getRepairDoneFlag() {
		return repairDoneFlag;
	}

	public void setRepairDoneFlag(String repairDoneFlag) {
		this.repairDoneFlag = repairDoneFlag;
	}

	public Timestamp getRepairDoneTime() {
		return repairDoneTime;
	}

	public void setRepairDoneTime(Timestamp repairDoneTime) {
		this.repairDoneTime = repairDoneTime;
	}

}
