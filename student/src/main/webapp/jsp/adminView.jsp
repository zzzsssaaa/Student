<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/1
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery-1.7.js"></script>
    <link href="../css/teacher.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        if ('${login}' == "成功") {
            alert('adminView登录成功！')
            location.href = 'init.do'
        }
        if ('${status}' != '') {
            <%--if ('${status}' == "分页查询") {--%>
                <%-- location.href = 'init.do'--%>
            <%--}--%>
            if ('${status}' == "请登录") {
                alert('请先登录！');
                location.href='jsp/login.jsp';
            }
            if ('${status}' == 4) {
                alert('删除成功！');
            }
            if ('${status}' == 5) {
                alert('删除失败！');
            }
            if ('${status}' == "成功") {
                alert('教职工名称修改成功！');
            }
            if ('${status}' == "失败") {
                alert('教职工名称修改失败！');
            }
            if ('${insert}' == "成功") {
                alert('添加成功！');

            }
            if ('${insert}' == "失败") {
                alert('添加失败！');
            }
        }
    </script>
</head>

<body>
<div class="divtop">
    <div class="divtopleft">
        <div class="divtoplogo"></div></div>

    <div class="divtopright">
        <div class="divtopmessage"><span style="margin-right:40px;">欢迎登录学生信息管理系统!</span></div></div>
    </div>

<div class="body">
    <div class="bodytop">
    </div>

    <div class="bodybottom">
        <table class="table table-bordered table1">
            <tr>
                <td width="300px">辅导员：王慧慧</td>
                <td >15计算机科学与技术1、2班</td>
                <td width="300px"><a href="/logout">退出登录</a></td>
            </tr>
            <tr>
                <td colspan="3">
                    <label>第${page.currentPage}/${page.totalPage}页共${page.totalRows}条</label>
                    <a href="init.do?currentPage=1">首页</a>
                    <a href="init.do?currentPage=${page.currentPage-1}" onclick="return checkFirst()">上一页</a>
                    <a href="init.do?currentPage=${page.currentPage+1}" onclick="return checkNext()">下一页</a>
                    <a href="init.do?currentPage=${page.totalPage}">尾页</a>
                    跳转到:<input type="text" style="width:30px" id="turnPage" />页
                    <input type="button" onclick="startTurn()" value="跳转" />
                    <span><a href="<%=basePath%>studentAdd">添加</a></span>
                </td>
            </tr>
        </table>
        <table class="table table-bordered table1">
            <tr>
                <td width="45px">序号</td>
                <td width="45px">学号</td>
                <td width="65px">姓名</td>
                <td width="45px">性别</td>
                <td width="80px">政治面貌</td>
                <td width="150px">身份证号</td>
                <td width="45px">QQ</td>
                <td width="48px">个人电话</td>
                <td width="48px">家长电话</td>
                <td width="150px">家庭住址</td>
                <td width="45px">编辑</td>
                <td width="45px">删除</td>
            </tr>
            <c:if test="${!empty studentList }">
                <c:forEach items="${studentList}" var="user">
                    <tr>
                        <td>${user.sid }</td>
                        <td>${user.sstudentnumber }</td>
                        <td>${user.sname }</td>
                        <td>${user.ssex }</td>
                        <td>${user.szhengzhi }</td>
                        <td>${user.sidnumber }</td>
                        <td>${user.sqq }</td>
                        <td>${user.stel }</td>
                        <td>${user.stelparent }</td>
                        <td>${user.saddress }</td>
                        <td><a href="<%=basePath%>adminUpdateStudent?sstudentnumber=${user.sstudentnumber}">编辑</a></td>
                        <td><a href="<%=basePath%>isdelete.do?sstudentnumber=${user.sstudentnumber}">删除</a></td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
            <table>
                <tr>
                    <td>
                        <form role="form" action="/adminTeacherName" method="GET">
                        <input name="number" type="text">
                        <input name="pwd" type="text">
                        <input type="submit" value="更新teacherName">
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form role="form" action="/OneStudent" method="get">
                            <input name="id" type="text">
                            <input type="submit" value="提交">
                        </form>
                    </td>
                </tr>
            </table>
    </div>
</div>

<script type="text/javascript">

    function checkFirst(){
        if(${page.currentPage>1}){
            return true;
        }
        alert("已到页首,无法加载更多");
        return false;
    }

    function checkNext(){
        if(${page.currentPage<page.totalPage}){
            return true;
        }
        alert("已到页尾，无法加载更多页");
        return false;
    }

    function startTurn(){
        var turnPage=document.getElementById("turnPage").value;
        if(turnPage>${page.totalPage}){
            alert("对不起已超过最大页数");
            return false;
        }
        if(turnPage<1){
            alert("对不起输入的页数无效");
            return false;
        }

        var shref="init.do?currentPage="+turnPage;
        window.location.href=shref;
    }
</script>
</body>
</html>
