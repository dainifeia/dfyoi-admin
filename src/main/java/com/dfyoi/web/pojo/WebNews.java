package com.dfyoi.web.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class WebNews {
    private Integer id;
    
    private String title;

    private String sym;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date publishDate;

    private Date createDate;

    private String createPersonName;

    private String createUserName;

    private Integer createDeptId;

    private String createDeptName;

    private String imgUrl;

    private String imgPath;

    private Integer clickCount;

    private String content;
    
    private Integer stts;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSym() {
        return sym;
    }

    public void setSym(String sym) {
        this.sym = sym == null ? null : sym.trim();
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreatePersonName() {
		return createPersonName;
	}

	public void setCreatePersonName(String createPersonName) {
		this.createPersonName = createPersonName;
	}

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName == null ? null : createUserName.trim();
    }

    public Integer getCreateDeptId() {
        return createDeptId;
    }

    public void setCreateDeptId(Integer createDeptId) {
        this.createDeptId = createDeptId;
    }

    public String getCreateDeptName() {
        return createDeptName;
    }

    public void setCreateDeptName(String createDeptName) {
        this.createDeptName = createDeptName == null ? null : createDeptName.trim();
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath == null ? null : imgPath.trim();
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
    
    public Integer getStts() {
        return stts;
    }

    public void setStts(Integer stts) {
        this.stts = stts;
    }
}