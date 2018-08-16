package com.student.controller;

import com.student.entity.Admin;
import com.student.entity.Login;
import com.student.entity.Page;
import com.student.entity.Student;
import com.student.service.DividePageService;
import com.student.service.impl.DividePageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@Scope("prototype")
public class DividePageController {

    @Autowired
    private DividePageService dividePageService;
    String adminRole = "2";

    @RequestMapping("init.do")
    public String searchInvList1(Page page, HttpSession session, Model model) throws UnsupportedEncodingException {
        Login login = (Login) session.getAttribute("login");
        if(login!=null&&login.getRole().equals(adminRole)){
            searchInvList(page,session);
        }else{
            model.addAttribute("status", "请登录");
        }
        return "adminView";
    }

    public void searchInvList(Page page,HttpSession session) throws UnsupportedEncodingException {
        Page pages = (Page) session.getAttribute("page");
        if(page.getCurrentPage()==0){
            if(pages!=null){
            page.setCurrentPage(pages.getCurrentPage());
            }
        }

        //组装page对象,传入方法中查询列表 回显数据
        Page p =page;
        int pageSize=4; //设置每页大小
        p.setPageSize(pageSize);
        int curPage=p.getCurrentPage();

        if (curPage==0) {
            curPage=1;
            p.setCurrentPage(curPage);
        }
        int startRow =page.getStartRow();

        if (!(p.getCurrentPage()==0)) {
            startRow = getStartRowBycurrentPage(curPage, pageSize);
        }

        p.setStartRow(startRow);

        String queryCondition=null;
        if (page.getQueryCondition()!=null) {
            queryCondition = page.getQueryCondition();//查询条件
        }

        List<Student> Studentlist = getInvListByCondition(page,session);

        Integer totalCounts = dividePageService.searchTotalCount(page);//总条数

        int totalPages=(totalCounts%pageSize==0)?(totalCounts/pageSize):(totalCounts/pageSize+1);//总页数=总条数/页大小+1

        page.setTotalPage(totalPages);//总页数

        page.setTotalRows(totalCounts);//总行数
        session.setAttribute("studentList", Studentlist);
        session.setAttribute("page", page);
        //request.setAttribute("studentListr", Studentlist);
        //request.setAttribute("pager", page);
    }
    @RequestMapping("/divide/studentList")
    private List<Student> getInvListByCondition(Page page,HttpSession session) {
        List<Student> Studentlist =null;
        if (page.getQueryCondition()==null) {
            Studentlist = dividePageService.searchInvList(page);
            //如果查询条件为空，马么就select * from student limit #{startRow},#{pageSize}
            session.setAttribute("studentList", Studentlist);
            return Studentlist;

        }

        Studentlist = dividePageService.getInvBycondtion(page);
//        如果条件不为空，  select * from student
//        <where>
//            <if test="queryCondition!=null">
//                title like  CONCAT('%',#{queryCondition},'%')
//            </if>
//        </where>
        return Studentlist;
    }

    /**
     * 删除帖子的方法
     * @param sstudentnumber
     * @return
     */

    @RequestMapping("isdelete.do")
    public String deleteInvition(Integer sstudentnumber,HttpSession session) {
        dividePageService.deleteInvition(sstudentnumber);
        Page page = (Page) session.getAttribute("page");
        List<Student> Studentlist = getInvListByCondition(page,session);
        session.setAttribute("studentList", Studentlist);
        return "adminView";
    }

    /**
     * 根据当前页获取开始行
     * @param currentPage
     * @param pageSize
     * @return
     */

    public int getStartRowBycurrentPage(int currentPage,int pageSize){
        int startRow=0;
        if (currentPage==1) {
            return startRow=0;
        }
        startRow=(currentPage-1)*pageSize;
        return startRow;

    }
}