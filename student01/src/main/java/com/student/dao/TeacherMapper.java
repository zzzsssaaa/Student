package com.student.dao;

import com.student.entity.Login;
import com.student.entity.Student;
import com.student.entity.Teacher;

import java.util.ArrayList;

public interface TeacherMapper {
    boolean adminUpdateTeacher(Teacher teacher);
    boolean adminUpdateClasses(Login login);

    ArrayList<Teacher> teacherList();
    ArrayList<Teacher> selectTeacher(Teacher teacher);

    boolean deleteTeacher(int tid);
    boolean updateTeacher(Teacher teacher);
    boolean addTeacher(Teacher teacher);

}
