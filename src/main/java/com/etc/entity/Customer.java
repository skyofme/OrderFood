package com.etc.entity;

public class Customer {
	
	private Integer cId;
	private String cName;
	private String cPswd;
	private String cPhone;
	private String cEmail;
	private String cAddress;
	public Customer(Integer cId, String cName, String cPswd, String cPhone,
			String cEmail, String cAddress) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cPswd = cPswd;
		this.cPhone = cPhone;
		this.cEmail = cEmail;
		this.cAddress = cAddress;
	}
	public Customer() {
		super();
	}
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcPswd() {
		return cPswd;
	}
	public void setcPswd(String cPswd) {
		this.cPswd = cPswd;
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	@Override
	public String toString() {
		return "Customer [cId=" + cId + ", cName=" + cName + ", cPswd=" + cPswd
				+ ", cPhone=" + cPhone + ", cEmail=" + cEmail + ", cAddress="
				+ cAddress + "]";
	}
	public Customer(Integer cId) {
		super();
		this.cId = cId;
	}
	
}
