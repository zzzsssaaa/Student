package com.test.ssh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.test.ssh.domain.Department;
import com.test.ssh.domain.Page;
import com.test.ssh.domain.Page;
import com.test.ssh.service.DepartmentService;
import com.test.ssh.service.impl.DepartmentServiceImpl;

import java.util.List;

public class DepartmentAction extends ActionSupport implements ModelDriven<Department> {

    //模型使用的驱动
    private Department department = new Department();
    private DepartmentService departmentService;

    /**
     * 查询并设置页数的操作
     * 先默认当前页面 currPage = 1
     */
    private Integer currPage = 1;

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public String findAll() {
        Page<Department> pageBean = departmentService.findByPage(currPage);
        //将pageBean 存入到值栈中
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findAll";
    }

    //添加部门
    public String save() {
        departmentService.save(department);
        return "saveSuccess";
    }

    /**
     * 我们在findAll页面里点击了 编辑按钮后，调用edit 方法，
     * 主要是获取想要修改的部门的属性，并展现在网页中，
     * 待用户修改完成后，点击保存，则调用的是 update() 方法进行更新
     */
    //编辑部门的执行的方法
    public String edit() {
        department = departmentService.findById(department.getDid());
        return "editSuccess";
    }

    //修改部门的执行的方法
    public String update() {
        departmentService.update(department);
        return "updateSuccess";
    }

    /**
     * 为了完成级联删除，即删除某一个部门，对应的所有员工都被删除
     * 需要先查询，后删除
     */
    public String delete() {
        department = departmentService.findById(department.getDid());
        departmentService.delete(department);
        return "deleteSuccess";
    }
    public String saveUI() {
        return "saveUI";
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public void setDepartmentService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @Override
    public Department getModel() {
        return department;
    }
}
