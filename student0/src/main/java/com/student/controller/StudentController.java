package com.student.controller;

import com.student.entity.Student;
import com.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    /**
     * 根据id查询单个用户
     */
    @RequestMapping("/getStudent")
    public String loginValidate(HttpSession session, Model model, @ModelAttribute Student student) {
        List<Student> list = new ArrayList<Student>();
        Student record  = new Student();
        record.setSname(student.getSname());
        list = studentService.selectSelective(record);
        if (list.size() == 0) {
            model.addAttribute("status", 1);//用户不存在
        } else {
            record.setSpwd(student.getSpwd());
            list = studentService.selectSelective(record);
            if (list.size() == 0) {
                model.addAttribute("status", 2);//密码错误
            }
            record = list.get(0);
            session.setAttribute("student", record);//
            model.addAttribute("status", 0);
        }

        return "index";
    }

    /**
     *编辑用户
     * @param student
     * @param request
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(Student student,HttpServletRequest request,Model model){
        if(studentService.update(student)){
            student = studentService.findById(student.getSid());
            request.setAttribute("student", student);
            model.addAttribute("student", student);
            return "redirect:/user/getAllUser";
        }else{
            return "/error";
        }
    }
}
