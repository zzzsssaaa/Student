package com.test.ssh.service;

import com.test.ssh.domain.Employee;
import com.test.ssh.domain.Page;

public interface EmployeeService {
    Employee login(Employee employee);

    Page<Employee> fingByPage(Integer currPage);

    void save(Employee employee);

    Employee findById(int eid);

    void update(Employee employee);

    void delete(Employee employee);
}

