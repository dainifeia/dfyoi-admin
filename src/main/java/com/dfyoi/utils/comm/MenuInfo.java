package com.dfyoi.utils.comm;

import java.util.List;

public class MenuInfo {
	private String id;
	private String text;
	private boolean isHeader;
	private boolean isOpen;
	private String icon;
	private String url;
	//blank和iframe-tab
	private String targetType;
	private List<MenuInfo> children;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public boolean getIsHeader() {
		return isHeader;
	}
	public void setIsHeader(boolean isHeader) {
		this.isHeader = isHeader;
	}
	public boolean getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(boolean isOpen) {
		this.isOpen = isOpen;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTargetType() {
		return targetType;
	}
	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}
	public List<MenuInfo> getChildren() {
		return children;
	}
	public void setChildren(List<MenuInfo> children) {
		this.children = children;
	}
}
