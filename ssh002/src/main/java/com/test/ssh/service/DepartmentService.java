package com.test.ssh.service;

import com.test.ssh.dao.DepartmentDao;
import com.test.ssh.domain.Department;
import com.test.ssh.domain.Page;

import java.util.List;

public interface DepartmentService {
    Page<Department> findByPage(Integer currPage);

    void setDepartmentDao(DepartmentDao departmentDao) ;

    List<Department> findAll();

    void save(Department department) ;

    void update(Department department) ;

    void delete(Department department) ;

    Department findById(int did) ;
}
