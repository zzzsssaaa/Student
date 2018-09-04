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
        function deleteTeacher() {
            con=confirm("确定要删除此条数据？"); //在页面上弹出对话框
            if(con==true){
                return true;
            } else {
                return false;
            }
        }
        if ('${status}' == 4) {
            alert('删除成功！');
        }
        if ('${status}' == 5) {
            alert('删除失败！');
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
                        <li><a href="turnPage?page=teacherList"><i class="fa fa-circle-o"></i> 信息查看</a></li>
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
                    <li>教职工信息管理</li>
                    <li class="active"><a href="#">信息查看</a></li>
                </ul>
            </div>
            <div>
                <a class="btn btn-primary btn-flat" href="turnPage?page=teacherAdd"><i class="fa fa-lg fa-plus"></i></a>
                <a class="btn btn-info btn-flat" href="#"><i class="fa fa-lg fa-refresh"></i></a>
                <a class="btn btn-warning btn-flat" href="#"><i class="fa fa-lg fa-trash"></i></a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th width="60px">工号</th>
                                    <th width="60px">姓名</th>
                                    <th width="60px">密码</th>
                                    <th width="100px">学院</th>
                                    <th width="80px">职衔</th>
                                    <th width="80px">编辑</th>
                                    <th width="80px">删除</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${!empty teacherList }">
                                    <c:forEach items="${teacherList}" var="teacher">
                                        <tr>
                                            <td>${teacher.tid }</td>
                                            <td>${teacher.tname }</td>
                                            <td>${teacher.tpwd }</td>
                                            <td>${teacher.tacademy }</td>
                                            <td>${teacher.ttag }</td>
                                            <td><a href="adminUpdateTeacher?tid=${teacher.tid}">编辑</a></td>
                                            <td><a href="adminDeleteTeacher?tid=${teacher.tid}" onclick="return deleteTeacher()">删除</a></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
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
</body>
</html>