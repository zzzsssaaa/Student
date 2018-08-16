<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>首页</title>
    <link href="/css/login.css" rel="stylesheet" type="text/css" />

    <script>
        if ('${login}' != '') {
            if ('${login}' == "不存在") {
                alert('该生信息不存在！');
            } else if ('${login}' == "失败") {
                alert('密码错误！')
            }
        }
    </script>
</head>
<body>

<h1>学生信息管理系统</h1>
<div class="divmain">
    <div class="divtitle1">
        <div class="divtitle2">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</div>
    </div>
    <div class="divbody">
        <form role="form" id="login" action="/userLogin.do" method="post">
            <table align="center" border="0">
                <tr class="tr">
                    <td class="td1">角<div style="color:rgba(255,255,255,0.5);display:inline;">隐</div>色：</td>
                    <%--<td class="td2">--%>
                        <%--<select class="form-control inputxtrole" >--%>
                            <%--<option value="学生" name="role">学生</option>--%>
                            <%--<option value="辅导员" name="role">辅导员</option>--%>
                            <%--<option value="管理员" name="role">管理员</option>--%>
                        <%--</select>--%>
                    <%--</td>--%>
                <td class="td2">
                    <input type="text" name="role" class="form-control inputxt" value="1" id="srole"/>
                </td>
                </tr>
                <tr class="trmessage">
                    <td></td>
                    <td class="tdmessage">
                        <div></div>
                    </td>
                </tr>

                <tr class="tr">
                    <td class="td1">用户名：</td>
                    <td class="td2">
                        <input type="text" name="number" class="form-control inputxt" value="3" id="sname"/>
                    </td>
                </tr>
                <tr class="trmessage">
                    <td></td>
                    <td class="tdmessage">
                        <div></div>
                    </td>
                </tr>

                <tr class="tr">
                    <td class="td1">密<div style="color:rgba(255,255,255,0.5);display:inline;">隐</div>码：</td>
                    <td class="td2">
                        <input type="password" name="pwd" class="form-control inputxt" value="3" id="spwd"/>
                    </td>
                </tr>

                <tr class="trmessage">
                    <td></td>
                    <td class="tdmessage">
                        <div></div>
                    </td>
                </tr>

                <tr class="trsubmit">
                    <td colspan="2">
                        <div id="bt" align="center">
                            <input type="reset" value="重置" class="btn btn-default">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" value="登录" class="btn btn-default">
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>