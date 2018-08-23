package com.test.ssh.dao;

import com.test.ssh.domain.Department;

import java.util.List;

public interface DepartmentDao {
    int findCount();

    List<Department> findByPage(int begin, int pageSize);

    List<Department> findAll() ;

    void save(Department department) ;

    Department findById(int did) ;

    void update(Department department) ;

    void delete(Department department) ;
}
