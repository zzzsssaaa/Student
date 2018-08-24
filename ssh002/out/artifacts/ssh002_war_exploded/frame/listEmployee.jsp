<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- ↑ 为 jsp 头文件 --%>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <title></title>
    <style type="text/css">
        .table1 {
            border: 1px solid #ddd;
            width: 900px;
        }

        thead {
            background-color: lightblue;
        }

    </style>
</head>
<body>
<table border="0" width="900px">
    <tr>
        <td align="center" style="font-size:24px; color:#666"> 员工管理</td>
    </tr>
    <tr>
        <%-- 此处暂时无用，但在后面的新增员工时起到作用，那时，不再修改 --%>
        <td align="right"><a href="employee_saveUI.action">添加</a></td>
    </tr>
</table>
<br/>
<table cellspacing="0" border="1" class="table1">
    <thead>
    <tr>
        <td align="center">编号</td>
        <td align="center">员工姓名</td>
        <td align="center">性别</td>
        <td align="center">出生日期</td>
        <td align="center">入职时间</td>
        <td align="center">所属部门</td>
        <td align="center">编辑</td>
        <td align="center">删除</td>
    </tr>
    </thead>
    <tbody><s:iterator value="list" var="e">
        <tr> <%-- 将原来的手动赋值改为从list 中得到的值 --%>
            <td align="center"><s:property value="#e.eid"/></td>
            <td align="center"><s:property value="#e.ename"/></td>
            <td align="center"><s:property value="#e.sex"/></td>
            <td align="center"><s:date name="#e.birthday" format="yyyy年MM月dd月"/></td>
            <td align="center"><s:date name="#e.joinDate" format="yyyy年MM月dd月"/></td>
            <td align="center"><s:property value="#e.department.dname"/></td>
                <%-- 此处暂时无用，但在后面的修改员工和删除员工时将起到作用，那时，不再另改 --%>
            <td align="center"><a href="employee_edit.action?eid=<s:property value="eid"/>"><img src="../images/编辑.png"></a>
            </td>
            <td align="center"><a href="employee_delete.action?eid=<s:property value="eid"/> "><img
                    src="../images/trash.gif"></a></td>
        </tr>
    </s:iterator></tbody>
</table>
<br/>
<table table border="0" cellspacing="0" cellpadding="0" width="900px">
    <tr>
        <td align="right"><span>第<s:property value="currPage"/> / <s:property value="totalPage"/> 页</span>
            <span>总记录数:<s:property value="totalCount"/>  每页显示：<s:property value="pageSize"/>条</span> <s:if
                    test="currPage != 1"> <a href="employee_findAll.action?currPage=1">[首页]</a> <a
                    href="employee_findAll.action?currPage=<s:property value="currPage-1"/>">[上一页]</a> </s:if> <s:if
                    test="currPage!=totalPage"> <a
                    href="employee_findAll.action?currPage=<s:property value="currPage+1"/>">[下一页]</a> <a
                    href="employee_findAll.action?currPage=<s:property value="totalPage"/> ">[尾页]</a> </s:if> </span>
        </td>
    </tr>
</table>
</body>
</html>
