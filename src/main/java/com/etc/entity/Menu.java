package com.etc.entity;

public class Menu {
	private Integer mId;
	private String mName;
	private Double mPrice;
	private Integer mNumber;
	private String mPicture;
	private FoodKind fk;
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public Double getmPrice() {
		return mPrice;
	}
	public void setmPrice(Double mPrice) {
		this.mPrice = mPrice;
	}
	public Integer getmNumber() {
		return mNumber;
	}
	public void setmNumber(Integer mNumber) {
		this.mNumber = mNumber;
	}
	public String getmPicture() {
		return mPicture;
	}
	public void setmPicture(String mPicture) {
		this.mPicture = mPicture;
	}
	public FoodKind getFk() {
		return fk;
	}
	public void setFk(FoodKind fk) {
		this.fk = fk;
	}
	@Override
	public String toString() {
		return "Menu [mId=" + mId + ", mName=" + mName + ", mPrice=" + mPrice
				+ ", mNumber=" + mNumber + ", mPicture=" + mPicture + ", fk="
				+ fk + "]";
	}
	public Menu(String mName, Double mPrice) {
		super();
		this.mName = mName;
		this.mPrice = mPrice;
	}
	public Menu() {
		super();
	}
	
	

}
