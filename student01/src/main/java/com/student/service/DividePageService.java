package com.student.service;


import com.student.entity.Page;
import com.student.entity.Student;
import java.util.List;

public interface DividePageService {
    public abstract List<Student> searchInvList(Page page);

    public abstract Integer searchTotalCount(Page page);

    public abstract Integer deleteInvition(Integer integer);

    public abstract List<Student> getInvBycondtion(Page page);

}
