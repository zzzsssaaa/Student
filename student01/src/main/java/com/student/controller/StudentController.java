package com.student.controller;

import com.student.entity.*;
import com.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private DividePageController dividePageController;
    String studentRole = "学生";
    String adminRole = "管理员";
    //跳转
    @RequestMapping(value="/turnPage", method = RequestMethod.GET)
    public String turnPage(HttpSession session,String page){
        if("teacherList".equals(page)){
            List<Teacher> teacherList = studentService.teacherList();
            session.setAttribute("teacherList", teacherList);
        }
        return page;
    }
    //登录入口，跳转到student登录、或admin登录

    @RequestMapping(value="/userLogin.do", method = RequestMethod.POST)
    public String UserLogin(HttpSession session,HttpServletRequest request, Model model, @ModelAttribute Login login) {

        String str = login.getRole();
        if (studentRole.equals(str)) {
            if(StudentLogin(session, model, login)){
                return "studentView";
            }
        }
        if (adminRole.equals(str)) {
            if(AdminLogin(session, request,model, login)){
                return "index";
            }
        }
        if (str==null) {
            if(AdminLogin(session, request,model, login)){
                return "index";
            }
        }
        return "login";
    }

    //student登录
    @RequestMapping(value="/student/login", method = RequestMethod.POST)
    public boolean StudentLogin(HttpSession session, Model model, @ModelAttribute Login login) {
        Student student = new Student();
        student.setSstudentnumber(login.getNumber());
        List<Student> list = studentService.selectSelective(student);
        if (list.size() == 0) {
            model.addAttribute("login", "不存在");
        }else if(list.get(0).getSpwd().equals(login.getPwd())){
            Student student1 = list.get(0);
            session.setAttribute("student",student1);
            session.setAttribute("login",login);
            model.addAttribute("login", "成功");
            return true;
        }else{
            model.addAttribute("login", "失败");
        }
        return false;
    }

    //admin登录
    @RequestMapping(value="/admin/login", method = RequestMethod.POST)
    public boolean AdminLogin(HttpSession session, HttpServletRequest request,Model model, @ModelAttribute Login login) {
        Admin admin = new Admin();
        admin.setAnumber(login.getNumber());
        List<Admin> list = studentService.adminLogin(admin);
        if (list.size() == 0) {
            model.addAttribute("login", "不存在");
        }else if(list.get(0).getApwd().equals(login.getPwd())){
            Admin admin1 = list.get(0);
            session.setAttribute("admin",admin1);
            session.setAttribute("login",login);
            model.addAttribute("login", "成功");
            return true;
        }else{
            model.addAttribute("login", "失败");
        }
        return false;
    }

    //获取login的role信息，确定student、或是admin登录，并跳转到相应界面
    @RequestMapping(value="/turnView", method = RequestMethod.GET)
    public String loginView(Model model, HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
        Login login = (Login) session.getAttribute("login");
        Page page = (Page) session.getAttribute("page");
        if(login.getRole()!=null) {
            if (login.getRole().equals(studentRole)) {
                Student student = new Student();
                student.setSstudentnumber(login.getNumber());
                List<Student> list = studentService.selectSelective(student);
                Student student1 = list.get(0);
                session.setAttribute("student", student1);
                return "studentView";
            }

            if (login.getRole().equals(adminRole)) {
//            model.addAttribute("status", "分页查询");
//            便利全部
//            List<Student> listStudent = studentService.adminListStudent();
//            //model.addAttribute("studentList", listStudent);
//            session.setAttribute("studentList", listStudent);
                dividePageController.searchInvList1(page, session, model);
                return "adminView";
            }
        }else {
            dividePageController.searchInvList1(page, session, model);
            return "index";
        }
        return "login";
    }

    //studentView页面中点击修改，此方法跳转到studentEdit页面
    @RequestMapping(value="/student/edit", method = RequestMethod.GET)
    public String studentedit(Model model, HttpSession session) {
        return "studentEdit";
    }

    //adminView界面中删除一条数据
    @RequestMapping(value ="/adminDeleteStudent",method = RequestMethod.GET)
    public String adminDeleteStudent(String sstudentnumber,HttpServletRequest request,HttpServletResponse response,Model model,HttpSession session){

        if(studentService.adminDeleteStudent(sstudentnumber)){
            model.addAttribute("status", 4);
            List<Student> listStudent = studentService.adminListStudent();
            session.setAttribute("studentList", listStudent);
        }else{
            model.addAttribute("status", 5);
        }
        response.setContentType("application/json");
        return "adminView";
    }

    //adminView界面中修改一条数据，(根据sstudentnumber查找出一条信息，放到session中)，跳转到studentEdit界面
    @RequestMapping(value="/adminUpdateStudent", method = RequestMethod.GET)
    public String adminUpdateStudent(String sstudentnumber,HttpServletRequest request,HttpServletResponse response,Model model,HttpSession session){
        Student student = new Student();
        student.setSstudentnumber(sstudentnumber);
        List<Student> list = studentService.selectSelective(student);
        student = list.get(0);
        session.setAttribute("student", student);
        return "studentEdit";
    }

    //studentEdit页面中，修改信息，并根据session中的login，判断成功后的跳转页面
    @RequestMapping(value="/student/update", method = RequestMethod.POST)
    public String addUser(@ModelAttribute Student student, Model model) {
        if (studentService.update(student)) {
            model.addAttribute("status", 0);//修改成功！
        } else {
            model.addAttribute("status", 1);//修改失败，请重试！
        }
        return "studentEdit";
    }

    //admin添加Student
    @RequestMapping(value="/adminInsertStudent", method = RequestMethod.POST)
    public String adminInsertStudent(Student student,HttpServletRequest request,HttpServletResponse response,Model model,HttpSession session){
        if(studentService.insert(student)){
            model.addAttribute("insert", "成功");
        }else{
            model.addAttribute("insert", "失败");
        }
        return "studentAdd";
    }

    //退出登录
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        //session.removeAttribute("studnet");
        return "login";
    }

    @RequestMapping(value="/adminUpdateTeacher", method = RequestMethod.GET)
    public String adminUpdateTeacher(int tid,HttpServletRequest request,HttpServletResponse response,Model model,HttpSession session){
        Teacher teacher = new Teacher();
        teacher.setTid(tid);
        List<Teacher> list = studentService.selectTeacher(teacher);
        teacher = list.get(0);
        session.setAttribute("teacher", teacher);
        return "teacherEdit";
    }

    @RequestMapping(value="/teacher/update", method = RequestMethod.POST)
    public String teacherUpdate(@ModelAttribute Teacher teacher, Model model) {
        if (studentService.updateTeacher(teacher)) {
            model.addAttribute("status", 0);//修改成功！
        } else {
            model.addAttribute("status", 1);//修改失败，请重试！
        }
        return "teacherEdit";
    }

    //adminView界面中删除一条数据
    @RequestMapping(value ="/adminDeleteTeacher",method = RequestMethod.GET)
    public String adminDeleteTeacher(int tid,HttpServletRequest request,HttpServletResponse response,Model model,HttpSession session){
        if(studentService.deleteTeacher(tid)){
            model.addAttribute("status", 4);
            List<Teacher> listTeacher = studentService.teacherList();
            session.setAttribute("teacherList", listTeacher);
        }else{
            model.addAttribute("status", 5);
        }
        return "teacherList";
    }

    @RequestMapping(value="/addTeacher", method = RequestMethod.POST)
    public String addTeacher(Teacher teacher,HttpServletRequest request,HttpServletResponse response,Model model,HttpSession session){
        if(studentService.addTeacher(teacher)){
            model.addAttribute("addTeacher", "成功");
        }else{
            model.addAttribute("addTeacher", "失败");
        }
        return "teacherAdd";
    }

    //更新teachername，测试事务
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    @RequestMapping(value = "/updateTeacher", method = RequestMethod.POST)
    public String adminTeacherName(Teacher teacher,String oldName,Model model) {
        //运用login封装参数
        Login login = new Login();
        login.setNumber(oldName);
        login.setPwd(teacher.getTname());
        boolean str = studentService.adminUpdateTeacherName(teacher,login);
        if(str){
            model.addAttribute("status", "成功");
        }else{
            model.addAttribute("status", "失败");
        }
        return "teacherEdit";
    }

}
