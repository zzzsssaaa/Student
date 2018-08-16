<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/6
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../css/studentView.css" rel="stylesheet" type="text/css" />
    <title>studentView</title>
    <script type="text/javascript">
        if ('${insert}' != '') {
            if ('${insert}' == "成功") {
                var con;
                con=confirm("添加成功，是否继续添加？"); //在页面上弹出对话框
                if(con==true){

                } else {
                    location.href = 'jsp/adminView.jsp'
                }
            }
            if ('${insert}' == "失败") {
                alert('添加失败！');
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

    <form role="form" action="/adminInsertStudent" method="POST">
        <div class="divbody">
            <div class="divbodyleft">
                <img src="../images/01.png">
                <form role="form">
                    <table border="0" class="tableleft">
                        <tr>
                            <td class="td11">上传照片</td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="divbodyright">

                <h1>个人信息</h1>
                <table border="0" class="tableright">
                    <tr>
                        <td class="td3">学<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>号：</td>
                        <td class="td4"><input type="text" name="sstudentnumber" class="form-control inputxt"/></td>
                        <td class="td3">姓<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>名：</td>
                        <td class="td4"><input type="text" name="sname" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">性<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>别：</td>
                        <td class="td4"><input type="text" name="ssex" class="form-control inputxt"/></td>
                        <td class="td3">身份证号：</td>
                        <td class="td4"><input type="text" name="sidnumber" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">政治面貌：</td>
                        <td class="td4"><input type="text" name="szhengzhi" class="form-control inputxt"/></td>
                        <td class="td3">出生年月：</td>
                        <td class="td4"><input type="text" name="sbirthday" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">Email：</td>
                        <td class="td4"><input type="text" name="semail" class="form-control inputxt"/></td>
                        <td class="td3">个人电话：</td>
                        <td class="td4"><input type="text" name="stel" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">Q<div style="color:rgba(255,255,255,0.5);display:inline;">QQ Q</div>Q：</td>
                        <td class="td4"><input type="text" name="sqq" class="form-control inputxt"/></td>
                        <td class="td3">家长电话：</td>
                        <td class="td4"><input type="text" name="stelparent" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">家庭住址：</td>
                        <td class="td4" colspan="3"><input type="text" name="saddress" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" height="30px"></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <input type="submit" value="添加" class="btn btn-default">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" value="重置" onClick="location.href='/logout'" class="btn btn-default">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</c:if>
</body>
</html>
