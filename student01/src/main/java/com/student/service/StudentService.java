package com.student.service;

import com.student.entity.Admin;
import com.student.entity.Login;
import com.student.entity.Student;
import com.student.entity.Teacher;

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

    boolean adminUpdateTeacherName(Teacher teacher,Login login);

    ArrayList<Teacher> teacherList();
    ArrayList<Teacher> selectTeacher(Teacher teacher);
    boolean deleteTeacher(int tid);
    boolean updateTeacher(Teacher teacher);
    boolean addTeacher(Teacher teacher);
}
