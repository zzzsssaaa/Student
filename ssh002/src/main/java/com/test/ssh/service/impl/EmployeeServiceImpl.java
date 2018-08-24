package com.test.ssh.service.impl;

import com.test.ssh.dao.impl.EmployeeDaoImpl;
import com.test.ssh.domain.Employee;
import com.test.ssh.domain.Page;
import com.test.ssh.service.EmployeeService;

import java.util.List;

public class EmployeeServiceImpl implements EmployeeService{

    //先进行对 EmployeeDao 的注入
    private EmployeeDaoImpl employeeDao;
    public void setEmployeeDao(EmployeeDaoImpl employeeDao) {
        this.employeeDao = employeeDao;
    }

    @Override
    public Employee login(Employee employee) {
        return employeeDao.login(employee);
    }

    @Override
    public Page<Employee> fingByPage(Integer currPage) {
        Page<Employee> employeePageBean = new Page<Employee>();
        // 封装当前的页数
        employeePageBean.setCurrPage(currPage);

        //封装每页显示的记录数，默认为3
        int pageSize = 2;
        employeePageBean.setPageSize(pageSize);

        //封装总记录数,总记录数通过查询数据库获得
        int totalCount = employeeDao.findCount();
        employeePageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);
        employeePageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin = (currPage - 1) * pageSize;
        List<Employee> list = employeeDao.findByPage(begin, pageSize);
        employeePageBean.setList(list);
        return employeePageBean;
    }

    @Override
    public void save(Employee employee) {
        employeeDao.save(employee);
    }

    @Override
    public Employee findById(int eid) {
        return employeeDao.findById(eid);
    }

    @Override
    public void update(Employee employee) {
        employeeDao.update(employee);
    }

    @Override
    public void delete(Employee employee) {
        employeeDao.delete(employee);
    }
}
