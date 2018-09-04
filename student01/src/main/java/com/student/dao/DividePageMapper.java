package com.student.dao;

import com.student.entity.Page;
import com.student.entity.Student;
import java.util.List;

public interface DividePageMapper {
    public abstract List<Student> searchInvList(Page page);

    public abstract Integer searchTotalCount(Page page);

    public abstract Integer deleteInvition(Integer Integer);

    public abstract List<Student> getInvBycondtion(Page page);
}


