package com.student.dao;

import com.student.entity.Login;

public interface TeacherMapper {
    boolean adminUpdateTeacher(Login login);
    boolean adminUpdateClasses(Login login);

}
