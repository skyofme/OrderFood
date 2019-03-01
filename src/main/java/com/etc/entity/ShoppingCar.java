package com.etc.entity;

import java.util.List;

public class ShoppingCar {
	private Integer sId;
	private Menu menu;
	private Customer cus;
	private Integer mCount;
	
	public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Customer getCus() {
		return cus;
	}

	public void setCus(Customer cus) {
		this.cus = cus;
	}

	public Integer getmCount() {
		return mCount;
	}

	public void setmCount(Integer mCount) {
		this.mCount = mCount;
	}

	@Override
	public String toString() {
		return "ShoppingCar [sId=" + sId + ", menu=" + menu + ", cus=" + cus
				+ ", mCount=" + mCount + "]";
	}

	public ShoppingCar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShoppingCar(Menu menu, Customer cus) {
		super();
		this.menu = menu;
		this.cus = cus;
	}
	
	
}
