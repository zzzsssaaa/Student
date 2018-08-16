package com.student.service;

import com.student.entity.Admin;
import com.student.entity.Login;
import com.student.entity.Student;

import java.util.ArrayList;
import java.util.List;

public interface StudentService {

//student
    boolean update(Student record);
    ArrayList<Student> selectSelective(Student record);


//admin
    boolean adminDeleteStudent(String sstudentnumber);
    boolean adminUpdateStudent(String sstudentnumber);
    ArrayList<Admin> adminLogin(Admin admin);
    ArrayList<Student> adminListStudent();
    List outStudent();
    ArrayList<Student> adminSelectStudent(Student record);
    boolean insert(Student record);

    boolean adminUpdateTeacherName(Login login);

}
