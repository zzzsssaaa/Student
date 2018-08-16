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
    <title>studentView</title>
    <script>
        if ('${status}' != '') {
            if ('${status}' == 0) {
                location.href = 'init.do'
                alert('修改成功！')
            }else if ('${status}' == 1) {
                alert('修改失败，请重试！');
            }else if ('${status}' == 2) {
                alert('该生信息不存在！')
            }
            location.href = '/turnView'
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
        <form role="form" action="/upload" method="POST" enctype="multipart/form-data">
        <div class="divbodyleft">
            <img src="../images/01.png">
            <form role="form">
                <table border="0" class="tableleft">
                    <tr>
                        <td class="td11"><input type="file" name="image"/></td>
                    </tr>
                    <tr>
                        <td class="td11"><input type="submit" name="attachs" value="上传"/></td>
                    </tr>
                </table>
            </form>
        </div>
        </form>

        <form role="form" action="/student/update" method="POST">
        <div class="divbodyright">

            <h1>个人信息</h1>
                <table border="0" class="tableright">
                    <tr>
                        <td class="td3">学<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>号：</td>
                        <td class="td4"><input type="text" name="sstudentnumber" value="${student.sstudentnumber}" class="form-control inputxt" disabled/>
                            <input type="text" name="sstudentnumber" value="${student.sstudentnumber}" hidden/></td>
                        <td class="td3">姓<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>名：</td>
                        <td class="td4"><input type="text" name="sname" value="${student.sname}" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">性<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>别：</td>
                        <td class="td4"><input type="text" name="ssex" value="${student.ssex}" class="form-control inputxt"/></td>
                        <td class="td3">年<div style="color:rgba(255,255,255,0.5);display:inline;">隐隐</div>龄：</td>
                        <td class="td4"><input type="text" name="sage" value="23" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">政治面貌：</td>
                        <td class="td4"><input type="text" name="szhengzhi" value="${student.szhengzhi}" class="form-control inputxt"/></td>
                        <td class="td3">出生年月：</td>
                        <td class="td4"><input type="text" name="sbirthday" value="${student.sbirthday}" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">Email：</td>
                        <td class="td4"><input type="text" name="semail" value="${student.semail}" class="form-control inputxt"/></td>
                        <td class="td3">个人电话：</td>
                        <td class="td4"><input type="text" name="stel" value="${student.stel}" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">Q<div style="color:rgba(255,255,255,0.5);display:inline;">QQ Q</div>Q：</td>
                        <td class="td4"><input type="text" name="sqq" value="${student.sname}" class="form-control inputxt"/></td>
                        <td class="td3">家长电话：</td>
                        <td class="td4"><input type="text" name="stelparent" value="${student.stelparent}" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">身份证号：</td>
                        <td colspan="3" class="td4"><input type="text" name="sidnumber" value="${student.sidnumber}" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td class="td3">家庭住址：</td>
                        <td colspan="3" class="td4"><input type="text" name="saddress" value="${student.saddress}" class="form-control inputxt"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" height="30px"></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <input type="submit" value="提交更改" class="btn btn-default">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" value="退出登录" onClick="location.href='/logout'" class="btn btn-default">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</c:if>

</body>
</html>
