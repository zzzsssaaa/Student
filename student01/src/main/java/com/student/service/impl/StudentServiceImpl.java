package com.student.service.impl;

import com.student.dao.StudentMapper;
import com.student.dao.TeacherMapper;
import com.student.entity.Admin;
import com.student.entity.Login;
import com.student.entity.Student;
import com.student.entity.Teacher;
import com.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;


import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Resource
    private StudentMapper studentMapper;
    @Resource
    private TeacherMapper teacherMapper;

    //student
    public boolean update(Student record) {
        return studentMapper.update(record);
    }
    public ArrayList<Student> selectSelective(Student student) {
        return studentMapper.selectSelective(student);
    }

    //admin
    public boolean adminDeleteStudent (String sstudentnumber){
        return studentMapper.adminDeleteStudent(sstudentnumber);
    }
    public boolean adminUpdateStudent(String sstudentnumber){
        return studentMapper.adminUpdateStudent(sstudentnumber);
    }
    public ArrayList<Admin> adminLogin(Admin admin){
        return studentMapper.adminLogin(admin);
    }

    public ArrayList<Student> adminListStudent(){
        return studentMapper.adminListStudent();
    }
    public List outStudent(){
        return studentMapper.adminListStudent();
    }
    public ArrayList<Student> adminSelectStudent(Student record){
        return studentMapper.selectSelective(record);
    }
    public boolean insert(Student record){
        return studentMapper.insert(record);
    }

    //@Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public boolean adminUpdateTeacherName(Teacher teacher,Login login){
        try {
            teacherMapper.adminUpdateTeacher(teacher);
            teacherMapper.adminUpdateClasses(login);
        }catch (Exception e){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return false;
        }
        return true;
    }

    public ArrayList<Teacher> teacherList(){
        return teacherMapper.teacherList();
    }
    public ArrayList<Teacher> selectTeacher(Teacher teacher){
        return teacherMapper.selectTeacher(teacher);
    }
    public boolean deleteTeacher(int tid){
        return teacherMapper.deleteTeacher(tid);
    }
    public boolean updateTeacher(Teacher teacher){
        return teacherMapper.updateTeacher(teacher);
    }
    public boolean addTeacher(Teacher teacher){
        return teacherMapper.addTeacher(teacher);
    }
}
