package com.etc.entity;

import java.util.List;

public class FoodKind {
	private Integer fkId;
	private String fkName;
	private List<Menu> menus;
	public Integer getFkId() {
		return fkId;
	}
	public void setFkId(Integer fkId) {
		this.fkId = fkId;
	}
	public String getFkName() {
		return fkName;
	}
	public void setFkName(String fkName) {
		this.fkName = fkName;
	}
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	@Override
	public String toString() {
		return "FoodKind [fkId=" + fkId + ", fkName=" + fkName + ", menus="
				+ menus + "]";
	}
	
	
	
}
