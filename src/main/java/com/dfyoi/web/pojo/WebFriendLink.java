package com.dfyoi.web.pojo;

public class WebFriendLink {
    private Integer id;

    private String title;

    private String link;

    private String sym;

    private String logo;

    private String keyWords;

    private String linkType;

    private String linkFlag;

    private String descr;

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
        this.title = title == null ? null : title.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public String getSym() {
        return sym;
    }

    public void setSym(String sym) {
        this.sym = sym == null ? null : sym.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords == null ? null : keyWords.trim();
    }

    public String getLinkType() {
        return linkType;
    }

    public void setLinkType(String linkType) {
        this.linkType = linkType == null ? null : linkType.trim();
    }

    public String getLinkFlag() {
        return linkFlag;
    }

    public void setLinkFlag(String linkFlag) {
        this.linkFlag = linkFlag == null ? null : linkFlag.trim();
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr == null ? null : descr.trim();
    }

    public Integer getStts() {
        return stts;
    }

    public void setStts(Integer stts) {
        this.stts = stts;
    }
}