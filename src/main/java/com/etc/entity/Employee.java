package com.etc.entity;

public class Employee {
	private Integer eId;
	private String eName;
	private String ePswd;
	private String ePhone;
	private Role role;
	
	public Employee() {
		super();
	}

	public Integer geteId() {
		return eId;
	}

	public void seteId(Integer eId) {
		this.eId = eId;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getePswd() {
		return ePswd;
	}

	public void setePswd(String ePswd) {
		this.ePswd = ePswd;
	}

	public String getePhone() {
		return ePhone;
	}

	public void setePhone(String ePhone) {
		this.ePhone = ePhone;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Employee [eId=" + eId + ", eName=" + eName + ", ePswd=" + ePswd
				+ ", ePhone=" + ePhone + ", role=" + role + "]";
	}
	
	
	
	
}
