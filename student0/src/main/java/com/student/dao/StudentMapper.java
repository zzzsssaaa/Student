package com.student.dao;

import com.student.entity.Student;

import java.util.ArrayList;
import java.util.List;

public interface StudentMapper {
    ArrayList<Student> selectSelective(Student record);
    boolean update(Student student);
    Student findById(int sid);
}
