package com.etc.entity;

import java.util.List;

public class Role {
	private Integer rId;
	private String rRole;
	private List<Employee> emps;
	public Integer getrId() {
		return rId;
	}
	public void setrId(Integer rId) {
		this.rId = rId;
	}
	public String getrRole() {
		return rRole;
	}
	public void setrRole(String rRole) {
		this.rRole = rRole;
	}
	public List<Employee> getEmps() {
		return emps;
	}
	public void setEmps(List<Employee> emps) {
		this.emps = emps;
	}
	@Override
	public String toString() {
		return "Role [rId=" + rId + ", rRole=" + rRole + ", emps=" + emps + "]";
	}
	

}
