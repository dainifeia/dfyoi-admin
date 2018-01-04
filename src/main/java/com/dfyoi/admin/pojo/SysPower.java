package com.dfyoi.admin.pojo;

public class SysPower {
    private Integer id;

    private String name;

    private String sym;

    private Integer powerType;

    private String url;

    private String icon;

    private Integer openType;

    private Integer stts;

    private String descr;

    private Integer lft;

    private Integer rgt;

    private Integer level;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSym() {
        return sym;
    }

    public void setSym(String sym) {
        this.sym = sym == null ? null : sym.trim();
    }

    public Integer getPowerType() {
        return powerType;
    }

    public void setPowerType(Integer powerType) {
        this.powerType = powerType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    
    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
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

	public Integer getOpenType() {
		return openType;
	}

	public void setOpenType(Integer openType) {
		this.openType = openType;
	}

	public Integer getStts() {
		return stts;
	}

	public void setStts(Integer stts) {
		this.stts = stts;
	}
}