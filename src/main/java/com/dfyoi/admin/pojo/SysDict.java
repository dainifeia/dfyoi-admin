package com.dfyoi.admin.pojo;

/**
 * @Title 数据字典
 * @description 描述
 * @author huishen
 * @version 1.0
 * @createAt 2017年9月22日 下午3:31:22
 * @Copyright: Copyright (c) 2017 bjsszt. All Rights Reserved
 */
public class SysDict {
	private Integer id;

    private String text;

    private String value;

    private String sym;

    private String descr;

    private Integer orderNumber;

    private Integer lft;

    private Integer rgt;

    private Integer level;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }

    public String getSym() {
        return sym;
    }

    public void setSym(String sym) {
        this.sym = sym == null ? null : sym.trim();
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Integer getLft() {
        return lft;
    }

    public void setLft(Integer lft) {
        this.lft = lft;
    }

    public Integer getRgt() {
        return rgt;
    }

    public void setRgt(Integer rgt) {
        this.rgt = rgt;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }
}
