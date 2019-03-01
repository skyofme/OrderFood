package com.etc.entity;

public class OrderDetail {
	private int odId;			//订单详情序号
	private Order order;			//订单序号
	private Menu menu;			//菜序号
	private Integer mCount;			//订购数量
	public int getOdId() {
		return odId;
	}
	public void setOdId(int odId) {
		this.odId = odId;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public Integer getmCount() {
		return mCount;
	}
	public void setmCount(Integer mCount) {
		this.mCount = mCount;
	}
	@Override
	public String toString() {
		return "OrderDetail [odId=" + odId + ", order=" + order + ", menu=" + menu + ", mCount=" + mCount + "]";
	}
	public OrderDetail(int odId, Order order, Menu menu, Integer mCount) {
		super();
		this.odId = odId;
		this.order = order;
		this.menu = menu;
		this.mCount = mCount;
	}
	public OrderDetail() {
		super();
	}
	public OrderDetail(Menu menu) {
		super();
		this.menu = menu;
	}
	
	
}
