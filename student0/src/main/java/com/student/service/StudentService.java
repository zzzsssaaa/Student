package com.student.service;

import com.student.entity.Student;

import java.util.ArrayList;
import java.util.List;

public interface StudentService {
    ArrayList<Student> selectSelective(Student record);
    boolean update(Student student);
    Student findById(int sid);
}
