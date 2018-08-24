<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/22
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style type="text/css">
        .div1{ margin-top:50px; margin-left:600px; font-size:14px; color:white}
    </style>
</head>

<body bgcolor="#0099FF">
<div class="div1">
    欢迎您：<s:property value="#session.existEmployee.ename"/>
</div>
</body>
</html>