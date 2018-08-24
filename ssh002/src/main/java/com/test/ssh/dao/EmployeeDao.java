package com.test.ssh.dao;

import com.test.ssh.domain.Employee;

import java.util.List;

public interface EmployeeDao {
    Employee login(Employee employee);

    int findCount();

    List<Employee> findByPage(int begin, int pageSize);

    void save(Employee employee);

    Employee findById(int eid);

    void update(Employee employee);

    void delete(Employee employee);
}
