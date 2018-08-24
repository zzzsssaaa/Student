package com.test.ssh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.test.ssh.domain.Department;
import com.test.ssh.domain.Employee;
import com.test.ssh.domain.Page;
import com.test.ssh.service.DepartmentService;
import com.test.ssh.service.EmployeeService;

import java.util.List;

public class EmployeeAction extends ActionSupport implements ModelDriven<Employee> {
    //模型驱动使用的对象
    private Employee employee = new Employee();
    private Department department = new Department();

    //进入业务层类
    private EmployeeService employeeService;
    private DepartmentService departmentService;
    //可以先看做setter
    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public String login() {
        //此时，还未定义public Employee login(Employee employee)方法，会有报错
        Employee existEmployee = employeeService.login(employee);
        if(existEmployee == null){
            //方法返回值为空，登陆失败
            this.addActionError("用户名或密码错误");
            return INPUT;
        }else {
            //成功查询并返回，登陆成功
            ActionContext.getContext().getSession().put("existEmployee",existEmployee);
            return SUCCESS;
        }
    }

    @Override
    public Employee getModel() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    //首先，默认声明当前页数为 1
    private Integer currPage = 1;
    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public String findAll() {
        //使用 PageBean 对象装载分页情况
        Page<Employee> page = employeeService.fingByPage(currPage);
        ActionContext.getContext().getValueStack().push(page);
        return "findAll";
    }

    /**
     * 首先获取到所有的部门，更改员工所在的部门，然后跳转到真正添加员工的jsp
     */
    public String saveUI() {
        //查询部门
        List<Department> list = departmentService.findAll();
        //集合用 set 方法， 对象用 push
        ActionContext.getContext().getValueStack().set("list", list);
        return "saveUI";
    }


     //新增、保存员工的 save（）
    public String save() {
        Employee employee1 = employee;
        employeeService.save(employee);
        return "saveSuccess";
    }

     //更新员工信息的方法
    public String edit() {
        //根据员工ID 查询员工
        employee = employeeService.findById(employee.getEid());
        List<Department> list = departmentService.findAll();
        ActionContext.getContext().getValueStack().set("employee", employee);
        ActionContext.getContext().getValueStack().set("list", list);
        return "editSuccess";
    }

    public String update() {
        employeeService.update(employee);
        return "updateSuccess";
    }

    //删除员工使用的方法
    public String delete(){
        employeeService.delete(employee);
        return "deleteSuccess";
    }

}
