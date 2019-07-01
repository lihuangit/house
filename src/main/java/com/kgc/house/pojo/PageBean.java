package com.kgc.house.pojo;

/**
 * @program: house
 * @ClassName: PageBean
 * @author: Mr.Li
 * @create: 2019-06-29 19:48
 **/
public class PageBean {
    private Integer pageNum;
    private Integer pageSize=3;
    private String title;
    private Integer priceFrom;
    private Integer priceTo;
    private Integer districtId;
    private Integer streetId;
    private Integer typeId;
    private Integer floorageFrom;
    private Integer floorageTo;

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getPriceFrom() {
        return priceFrom;
    }

    public void setPriceFrom(Integer priceFrom) {
        this.priceFrom = priceFrom;
    }

    public Integer getPriceTo() {
        return priceTo;
    }

    public void setPriceTo(Integer priceTo) {
        this.priceTo = priceTo;
    }

    public Integer getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Integer districtId) {
        this.districtId = districtId;
    }

    public Integer getStreetId() {
        return streetId;
    }

    public void setStreetId(Integer streetId) {
        this.streetId = streetId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getFloorageFrom() {
        return floorageFrom;
    }

    public void setFloorageFrom(Integer flooageFrom) {
        this.floorageFrom = flooageFrom;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", title='" + title + '\'' +
                ", priceFrom=" + priceFrom +
                ", priceTo=" + priceTo +
                ", districtId=" + districtId +
                ", streetId=" + streetId +
                ", typeId=" + typeId +
                ", floorageFrom=" + floorageFrom +
                ", floorageTo=" + floorageTo +
                '}';
    }

    public Integer getFloorageTo() {
        return floorageTo;
    }

    public void setFloorageTo(Integer flooageTo) {
        this.floorageTo = flooageTo;
    }
}
