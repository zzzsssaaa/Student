<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../css/studentView.css" rel="stylesheet" type="text/css" />
    <title>student</title>
<script>
    if ('${login}' != '') {
        if ('${login}' == "成功") {
        alert('studentView登录成功！')
        }
    }
</script>
</head>
<body>
<c:if test="${ empty login}">
    对不起，请先<a href="login.jsp">登录</a>
</c:if>

<c:if test="${not empty login}">
<div class="divtop">
    <div class="divtopleft">
        <div class="divtoplogo"></div></div>

    <div class="divtopright">
        <div class="divtopmessage"><span style="margin-right:40px;">欢迎登录学生信息管理系统!</span></div></div>
</div>

<div class="divbody">
    <div class="divbodyleft">
        <img src="../images/01.png">
        <form role="form">
            <table border="0" class="tableleft">
                <tr>
                    <td class="td1">姓名：</td>
                    <td class="td2">${student.sname}</td>
                </tr>
                <tr>
                    <td class="td1">性别：</td>
                    <td class="td2">${student.ssex}</td>
                </tr>
                <tr>
                    <td class="td1">学号：</td>
                    <td class="td2">${student.sstudentnumber}</td>
                </tr>
            </table>
        </form>
    </div>
    <div class="divbodyright">
        <h1>个人信息</h1>
        <form role="form">
            <table border="0" class="tableright">
                <tr>
                    <td class="td3">学<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>号：</td>
                    <td class="td4">${student.sstudentnumber}</td>
                    <td class="td3">姓<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>名：</td>
                    <td class="td4">${student.sname}</td>
                </tr>
                <tr>
                    <td class="td3">性<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>别：</td>
                    <td class="td4">${student.ssex}</td>
                    <td class="td3">年<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>龄：</td>
                    <td class="td4">23</td>
                </tr>
                <tr>
                    <td class="td3">政治面貌：</td>
                    <td class="td4">${student.szhengzhi}</td>
                    <td class="td3">出生年月：</td>
                    <td class="td4">${student.sbirthday}</td>
                </tr>
                <tr>
                    <td class="td3">Email：</td>
                    <td class="td4">${student.semail}</td>
                    <td class="td3">个人电话：</td>
                    <td class="td4">${student.stel}</td>
                </tr>
                <tr>
                    <td class="td3">Q<div style="color:rgba(255,255,255,0.5);display:inline;">QQ Q</div>Q：</td>
                    <td class="td4">${student.sqq}</td>
                    <td class="td3">家长电话：</td>
                    <td class="td4">${student.stelparent}</td>
                </tr>
                <tr>
                    <td class="td3">身份证号：</td>
                    <td colspan="3" class="td4">${student.sidnumber}</td>
                </tr>
                <tr>
                    <td class="td3">家庭住址：</td>
                    <td colspan="3" class="td4">${student.saddress}</td>
                </tr>
                <tr>
                    <td colspan="4" height="30px" ></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <input type="reset" value="修改信息" onclick="location.href='/student/edit'" class="btn btn-default">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="退出登录" onclick="location.href='/logout'" class="btn btn-default">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</c:if>
</body>
</html>
