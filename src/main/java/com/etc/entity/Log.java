package com.etc.entity;

import java.util.Date;

public class Log {
	private Integer lId;
	private String lDate;
	private String lContent;
	private Employee emp;
	public Integer getlId() {
		return lId;
	}
	public void setlId(Integer lId) {
		this.lId = lId;
	}
	public String getlDate() {
		return lDate;
	}
	public void setlDate(String lDate) {
		this.lDate = lDate;
	}
	public String getlContent() {
		return lContent;
	}
	public void setlContent(String lContent) {
		this.lContent = lContent;
	}
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	@Override
	public String toString() {
		return "Log [lId=" + lId + ", lDate=" + lDate + ", lContent="
				+ lContent + ", emp=" + emp + "]";
	}
	

}
