package com.test.ssh.domain;

import java.util.HashSet;
import java.util.Set;

public class Department {

    private int did;            //部门的id
    private String dname;       //部门名称
    private String ddesc;       //部门的描述

    //部门对应的员工的集合
    private Set<Employee> employees = new HashSet<Employee>();

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDdesc() {
        return ddesc;
    }

    public void setDdesc(String ddesc) {
        this.ddesc = ddesc;
    }

    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }
}