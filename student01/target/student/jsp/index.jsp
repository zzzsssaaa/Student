<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS-->
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
    <title>Vali Admin</title>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--if lt IE 9
    script(src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js')
    script(src='https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js')
    -->
    <script type="text/javascript">
        if ('${login}' == "成功") {
//            alert('adminView登录成功！')
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
    <style type="text/css">
        td,th{
            font-size: 14px;
        }
        #biaoti{
            font-size: inherit;
        }
    </style>
</head>
<body class="sidebar-mini fixed">
<c:if test="${ empty login}">
    对不起，请先<a href="/jsp/login.jsp">登录</a>
</c:if>
<c:if test="${not empty login}">
<div class="wrapper">
    <!-- Navbar-->
    <header class="main-header hidden-print"><a class="logo" href="index.html">Vali</a>
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button--><a class="sidebar-toggle" href="#" data-toggle="offcanvas"></a>
            <!-- Navbar Right Menu-->
            <div class="navbar-custom-menu">
                <ul class="top-nav">
                    <!--Notification Menu-->
                    <li class="dropdown notification-menu"><a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell-o fa-lg"></i></a>
                        <ul class="dropdown-menu">
                            <li class="not-head">You have 4 new notifications.</li>
                            <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                                <div class="media-body"><span class="block">Lisa sent you a mail</span><span class="text-muted block">2min ago</span></div></a></li>
                            <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                                <div class="media-body"><span class="block">Server Not Working</span><span class="text-muted block">2min ago</span></div></a></li>
                            <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                                <div class="media-body"><span class="block">Transaction xyz complete</span><span class="text-muted block">2min ago</span></div></a></li>
                            <li class="not-footer"><a href="#">See all notifications.</a></li>
                        </ul>
                    </li>
                    <!-- User Menu-->
                    <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-lg"></i></a>
                        <ul class="dropdown-menu settings-menu">
                            <li><a href="#"><i class="fa fa-cog fa-lg"></i> 偏好设置</a></li>
                            <li><a href="/logout"><i class="fa fa-sign-out fa-lg"></i> 退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Side-Nav-->
    <aside class="main-sidebar hidden-print">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image"><img class="img-circle" src="../images/48.jpg" alt="User Image"></div>
                <div class="pull-left info">
                    <p>${admin.aname }</p>
                    <p class="designation">管理员</p>
                </div>
            </div>
            <!-- Sidebar Menu-->
            <ul class="sidebar-menu">
                <li class="treeview"><a href="#"><i class="fa fa-laptop"></i><span>学生信息管理</span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="turnPage?page=index"><i class="fa fa-circle-o"></i> 信息查看</a></li>
                        <li><a href="turnPage?page=studentEdit" target="_blank"><i class="fa fa-circle-o"></i> 信息修改</a></li>
                        <li><a href="turnPage?page=studentAdd"><i class="fa fa-circle-o"></i> 新增学生信息</a></li>
                    </ul>
                </li>
                <li class="treeview"><a href="#"><i class="fa fa-laptop"></i><span>教师信息管理</span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="turnPage?page=teacherList"><i class="fa fa-circle-o"></i> 教师信息查看</a></li>
                        <li><a href="turnPage?page=teacherEdit" target="_blank"><i class="fa fa-circle-o"></i> 信息修改</a></li>
                        <li><a href="turnPage?page=teacherAdd"><i class="fa fa-circle-o"></i> 新增教师信息</a></li>
                    </ul>
                </li>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <div class="page-title">
            <div>
                <h1>Data Table</h1>
                <ul class="breadcrumb side">
                    <li><i class="fa fa-home fa-lg"></i></li>
                    <li>学生信息管理</li>
                    <li class="active"><a href="#">信息查看</a></li>
                </ul>
            </div>
            <div>
                <a class="btn btn-primary btn-flat" href="turnPage?page=studentAdd"><i class="fa fa-lg fa-plus"></i></a>
                <a class="btn btn-info btn-flat" href="#"><i class="fa fa-lg fa-refresh"></i></a>
                <a class="btn btn-warning btn-flat" href="#"><i class="fa fa-lg fa-trash"></i></a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th width="50px">学号</th>
                                    <th width="65px">姓名</th>
                                    <th width="50px">性别</th>
                                    <th width="85px">政治面貌</th>
                                    <th width="150px">身份证号</th>
                                    <th width="45px">QQ</th>
                                    <th width="48px">个人电话</th>
                                    <th width="48px">家长电话</th>
                                    <th width="50px">编辑</th>
                                    <th width="50px">删除</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${!empty studentList }">
                                <c:forEach items="${studentList}" var="user">
                                    <tr>
                                        <td>${user.sstudentnumber }</td>
                                        <td>${user.sname }</td>
                                        <td>${user.ssex }</td>
                                        <td>${user.szhengzhi }</td>
                                        <td>${user.sidnumber }</td>
                                        <td>${user.sqq }</td>
                                        <td>${user.stel }</td>
                                        <td>${user.stelparent }</td>
                                        <td><a href="adminUpdateStudent?sstudentnumber=${user.sstudentnumber}">编辑</a></td>
                                        <td><a href="isdelete.do?sid=${user.sid}">删除</a></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                        <table class="table table-hover table-bordered" id="sampleTabl">
                            <tr>
                                <td>
                                    <label>第${page.currentPage}/${page.totalPage}页共${page.totalRows}条</label>
                                    <a href="init.do?currentPage=1">首页</a>
                                    <a href="init.do?currentPage=${page.currentPage-1}" onclick="return checkFirst()">上一页</a>
                                    <a href="init.do?currentPage=${page.currentPage+1}" onclick="return checkNext()">下一页</a>
                                    <a href="init.do?currentPage=${page.totalPage}">尾页</a>
                                    跳转到:<input type="text" style="width:30px" id="turnPage" />页
                                    <input type="button" onclick="startTurn()" value="跳转" />
                                    <span><a href="turnPage?page=studentAdd">添加</a></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Javascripts-->
<script src="../js/jquery-2.1.4.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/pace.min.js"></script>
<script src="../js/main.js"></script>
<script type="text/javascript" src="../js/jquery.datatables.min.js"></script>
<script type="text/javascript" src="../js/datatables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
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
</c:if>
</body>
</html>