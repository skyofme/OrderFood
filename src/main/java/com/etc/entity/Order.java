package com.etc.entity;

import java.util.Date;
import java.util.List;

public class Order {
	private Integer oId;			//订单序号
	private Date oDate;			//订单时间
	private String oState;		//订单状态
	private Customer customer;	//顾客ID
	private List<OrderDetail> orderdetail;
	private int nums;			//订单菜品的总和
	private double prices;		//订单的总价
	public int getoId() {
		return oId;
	}
	public void setoId(Integer oId) {
		this.oId = oId;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<OrderDetail> getOrderDetail() {
		return orderdetail;
	}
	public void setOrderDetail(List<OrderDetail> orderdetail) {
		this.orderdetail = orderdetail;
	}
	
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public double getPrices() {
		return prices;
	}
	public void setPrices(double prices) {
		this.prices = prices;
	}
	@Override
	public String toString() {
		return "Order [oId=" + oId + ", oDate=" + oDate + ", oState=" + oState + ", customer=" + customer
				+ ", orderdetail=" + orderdetail + "]";
	}
	public Order(Integer oId, Date oDate, String oState, Customer customer, List<OrderDetail> orderdetail) {
		super();
		this.oId = oId;
		this.oDate = oDate;
		this.oState = oState;
		this.customer = customer;
		this.orderdetail = orderdetail;
	}
	public Order() {
		super();
	}
	
	
}
