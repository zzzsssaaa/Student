package com.test.ssh.service.impl;

import com.test.ssh.dao.DepartmentDao;
import com.test.ssh.domain.Department;
import com.test.ssh.domain.Employee;
import com.test.ssh.domain.Page;
import com.test.ssh.service.DepartmentService;

import java.util.List;

public class DepartmentServiceImpl implements DepartmentService {

    private DepartmentDao departmentDao;
    public void setDepartmentDao(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    @Override
    public Page<Department> findByPage(Integer currPage) {
        Page<Department> departmentPageBean = new Page<Department>();
        // 封装当前的页数
        departmentPageBean.setCurrPage(currPage);

        //封装每页显示的记录数，默认为3
        int pageSize = 3;
        departmentPageBean.setPageSize(pageSize);

        //封装总记录数,总记录数通过查询数据库获得
        int totalCount = departmentDao.findCount();
        departmentPageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);
        departmentPageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin = (currPage - 1) * pageSize;
        List<Department> list = departmentDao.findByPage(begin, pageSize);
        departmentPageBean.setList(list);
        return departmentPageBean;
    }

    @Override
    public List<Department> findAll() {
        return departmentDao.findAll();
    }

    @Override
    public void save(Department department) {
        departmentDao.save(department);
    }

    @Override
    public void update(Department department) {
        departmentDao.update(department);
    }

    @Override
    public void delete(Department department) {
        departmentDao.delete(department);
    }


    @Override
    public Department findById(int did) {
        return departmentDao.findById(did);
    }
}
