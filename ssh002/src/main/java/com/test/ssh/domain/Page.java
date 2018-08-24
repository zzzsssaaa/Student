package com.test.ssh.domain;

import java.util.List;

/**
 * 因为分页查询适用于员工和部门两个，所以使用多态<T>。
 * @param <T>
 */
public class Page<T> {
    private int currPage;    //当前页面
    private int pageSize;   //每页显示的记录数
    private int totalCount; //总记录数
    private int totalPage;  //总页数
    private List<T> list;   //没有显示的数据

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

}
