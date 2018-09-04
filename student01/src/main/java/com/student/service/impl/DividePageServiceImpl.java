package com.student.service.impl;

import java.util.List;

import com.student.dao.DividePageMapper;
import com.student.entity.Page;
import com.student.entity.Student;
import com.student.service.DividePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DividePageServiceImpl implements DividePageService {

    @Autowired
    private DividePageMapper dividePageMapper;

    public List<Student> searchInvList(Page page)
    {
        return this.dividePageMapper.searchInvList(page);
    }

    public Integer deleteInvition(Integer id)
    {
        return this.dividePageMapper.deleteInvition(id);
    }

    public Integer searchTotalCount(Page page)
    {
        return this.dividePageMapper.searchTotalCount(page);
    }

    public List<Student> getInvBycondtion(Page page) {
        return this.dividePageMapper.getInvBycondtion(page);
    }

}
