package com.test.ssh.dao.impl;

import com.test.ssh.dao.DepartmentDao;
import com.test.ssh.dao.EmployeeDao;
import com.test.ssh.domain.Department;
import com.test.ssh.domain.Employee;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;


public class DepartmentDaoImpl extends HibernateDaoSupport implements DepartmentDao {

    @Override
    public int findCount() {
        //查询个数
        String hql = "select count(*) from Department ";
        List<Long> list = this.getHibernateTemplate().find(hql);
        //如果个数
        if (list.size() > 0) {
            return list.get(0).intValue();
            //将Long 类型转为 int 类型后返回.
        }
        return 0;
    }

    @Override
    public List<Department> findByPage(int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Department.class);
        List<Department> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }

    @Override
    public List<Department> findAll() {
        //查询到所有语句的 hql 语句。
        List<Department> list = this.getHibernateTemplate().find("from Department ");
        return list;
    }

    @Override
    public void save(Department department) {
        this.getHibernateTemplate().save(department);
    }

    @Override
    public Department findById(int did) {
        return this.getHibernateTemplate().get(Department.class,did);
    }

    @Override
    public void update(Department department) {
        this.getHibernateTemplate().update(department);
    }

    @Override
    public void delete(Department department) {
        this.getHibernateTemplate().delete(department);
    }
}
