package com.student.service.impl;


import com.student.dao.StudentMapper;
import com.student.entity.Student;
import com.student.service.StudentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service
@Transactional
// 此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class StudentServiceImpl implements StudentService {

    @Resource
    private StudentMapper studentMapper;
    //登录
    public ArrayList<Student> selectSelective(Student record) {
        return studentMapper.selectSelective(record);
    }
    /**
     * 根据 id 查询 对应数据
     */
    public Student findById(int id) {
        Student student = studentMapper.findById(id);
        return student;
    }
    /**
     * 根据 id 修改对应数据
     */
    public boolean update(Student student) {
        return studentMapper.update(student);
    }

}
