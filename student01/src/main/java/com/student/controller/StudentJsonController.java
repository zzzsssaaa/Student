package com.student.controller;

import com.student.entity.Student;
import com.student.service.StudentService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StudentJsonController {

    @Autowired
    private StudentService studentService;

    //http://localhost:8084/OneStudent/1
    @RequestMapping(value="/OneStudent/{id}", method = RequestMethod.GET)
    public @ResponseBody Student OneStudent(@PathVariable int id) {
        System.out.println("-----请求json数据--------");
        Student student = new Student();
        student.setSid(id);
        List<Student> list = studentService.selectSelective(student);
        student = list.get(0);
        System.out.println(student.toString());
        return student;
    }

    @RequestMapping(value="/OneStudent2", method = RequestMethod.GET)
    public @ResponseBody Student OneStudent2(int id) {
        System.out.println("-----请求json数据--------");
        Student student = new Student();
        student.setSid(id);
        List<Student> list = studentService.selectSelective(student);
        student = list.get(0);
        System.out.println(student.toString());
        System.out.println("-----请求json数据结束--------");
        return student;
    }

    @RequestMapping(value="/OneStudent1", method = RequestMethod.GET)
    public String OneStudentl(int id, HttpSession session) {
        System.out.println("-----请求json数据1--------");
        Student student = new Student();
        student.setSid(id);
        List<Student> list = studentService.selectSelective(student);
        student = list.get(0);

        JSONObject jsonObject =  JSONObject.fromObject(student);
        System.out.println(student);
        //System.out.println(jsonObject);
        session.setAttribute("jsonObject",jsonObject);
        System.out.println(jsonObject.toString());
        return "111";
    }


}
