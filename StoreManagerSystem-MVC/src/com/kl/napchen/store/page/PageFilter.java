package com.kl.napchen.store.page;

public class PageFilter implements java.io.Serializable {

	private int offset;// 当前页
	private int limit;// 每页显示记录数
	private String sort;// 排序字段
	private String order;// asc/desc

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}
