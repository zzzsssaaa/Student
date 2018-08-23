<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
    将声明头更改为jsp 的声明头文件 ，并且增加一个标签库，
    控制标签可以完成输出流程控制，例如分支，循环等操作，也可以完成对集合的合并，排序等操作。（具体用法建议 百度）
--%>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <title>登陆</title>
    <link type="text/css" rel="stylesheet" href="style/reset.css">
    <link type="text/css" rel="stylesheet" href="style/main.css">
    <!--[if IE 6]>
    <script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
    <script type="text/javascript" src="js/ie6Fixpng.js"></script>
    <![endif]-->
</head>

<body>
<div class="headerBar">
    <div class="logoBar login_logo">
        <div class="comWidth">
            <div class="logo fl">
                <a href="#"><img src="images/logo.jpg" alt="慕课网"></a>
            </div>
            <h3 class="welcome_title">欢迎登陆</h3>
        </div>
    </div>
</div>
<s:form action="employee_login" method="post" namespace="/">
    <%--
    <s:form action="login" namespace="/">
     它表示的是<form id="login" name="login" action="login.action" method="post">
     因为它使用了struts标签，后面会自动加“.action”,而且namespace会起作用
     employee_login将在 struts 2的配置文件中 struts.xml 中被配置
    --%>
    <div class="loginBox">
        <h3><s:actionerror/></h3>
            <%--输出登陆失败的错误信息，将在Action的login()方法被赋值，null时不显示--%>

        <div class="login_cont">
            <ul class="login">
                <li class="l_tit">用户名</li>
                <li class="mb_10"><input type="text" name="username" class="login_input user_icon"></li>
                    <%--添加了 name = "username"--%>
                <li class="l_tit">密码</li>
                <li class="mb_10"><input type="password" name="password" class="login_input user_icon"></li>
                    <%--更改 type="password", 添加了 name = "password" ……END……--%>
                <li><input type="submit" value="" class="login_btn"></li>
            </ul>
            <div class="login_partners">
                <p class="l_tit">使用合作方账号登陆网站</p>
                <ul class="login_list clearfix">
                    <li><a href="#">QQ</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">网易</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">新浪微博</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">腾讯微薄</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">新浪微博</a></li>
                    <li><span>|</span></li>
                    <li><a href="#">腾讯微薄</a></li>
                </ul>
            </div>
        </div>

    </div>
</s:form>
<div class="hr_25"></div>
<div class="footer">
    <p><a href="#">慕课简介</a><i>|</i><a href="#">慕课公告</a><i>|</i> <a href="#">招纳贤士</a><i>|</i><a href="#">联系我们</a><i>|</i>客服热线：400-675-1234
    </p>
    <p>Copyright &copy; 2006 - 2014 慕课版权所有   京ICP备09037834号   京ICP证B1034-8373号   某市公安局XX分局备案编号：123456789123</p>
    <p class="web"><a href="#"><img src="images/webLogo.jpg" alt="logo"></a><a href="#"><img src="images/webLogo.jpg"
                                                                                             alt="logo"></a><a href="#"><img
            src="images/webLogo.jpg" alt="logo"></a><a href="#"><img src="images/webLogo.jpg" alt="logo"></a></p>
</div>
</body>
</html>
