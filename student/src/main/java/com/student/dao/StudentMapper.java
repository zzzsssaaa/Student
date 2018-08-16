package com.student.dao;

import com.student.entity.Admin;
import com.student.entity.Login;
import com.student.entity.Student;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

public interface StudentMapper {

    boolean update(Student record);
    ArrayList<Student> selectSelective(Student record);

    boolean adminDeleteStudent(String sstudentnumber);
    boolean adminUpdateStudent(String sstudentnumber);
    ArrayList<Admin> adminLogin(Admin admin);
    ArrayList<Student> adminListStudent();
    List outStudent();
    ArrayList<Student> adminSelectStudent(Student record);
    boolean insert(Student record);

    boolean adminUpdateTeacher(Login login);
    boolean adminUpdateClasses(Login login);

}
