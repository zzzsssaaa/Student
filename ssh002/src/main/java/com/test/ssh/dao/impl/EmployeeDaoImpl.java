package com.test.ssh.dao.impl;

import com.test.ssh.dao.EmployeeDao;
import com.test.ssh.domain.Employee;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;
/**
 * 这里继承了HibernateDaoSupport,该类主要提供两个方法,方便 DAO 的实现
 * public final void setSessionFactory(SessionFactory sessionFactory)
 *          用来接收Spring的ApplicationContext的依赖注入
 * public final HibernateTemplate getHibernateTemplate()
 *          用来根据刚才的SessionFactory产生Session，最后生成HibernateTemplate来完成数据库访问。
 */
public class EmployeeDaoImpl extends HibernateDaoSupport implements EmployeeDao{
    @Override
    public Employee login(Employee employee) {
        String hql = "FROM Employee WHERE username = ? AND password = ?";
        List<Employee> list = this.getHibernateTemplate().find(hql, employee.getUsername(), employee.getPassword());
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public int findCount() {
        //查询个数
        String hql = "select count(*) from Employee ";
        List<Long> list = this.getHibernateTemplate().find(hql);
        //如果个数
        if (list.size() > 0) {
            return list.get(0).intValue();
            //将Long 类型转为 int 类型后返回.
        }
        return 0;
    }

    @Override
    public List<Employee> findByPage(int begin, int pageSize) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Employee.class);
        List<Employee> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
        return list;
    }

    @Override
    public void save(Employee employee) {
        Employee employee1 = employee;
        this.getHibernateTemplate().save(employee);
    }

    @Override
    public Employee findById(int eid) {
        return  this.getHibernateTemplate().get(Employee.class,eid);
    }

    @Override
    public void update(Employee employee) {
        this.getHibernateTemplate().update(employee);
    }

    @Override
    public void delete(Employee employee)  {
        this.getHibernateTemplate().delete(employee);
    }
}
