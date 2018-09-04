<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <style type="text/css">
        .sex1{
            float: left;
            width: 50px;
            margin-left: 10px;
        }
        .sex2{
            float: left;
            width: 50px;
            margin-left: 60px;
        }
    </style>
    <script type="text/javascript">
        if ('${insert}' != '') {
            if ('${insert}' == "成功") {
                var con;
                con=confirm("添加成功，是否继续添加？"); //在页面上弹出对话框
                if(con==true){

                } else {
                    location.href = 'init.do'
                }
            }
            if ('${insert}' == "失败") {
                alert('添加失败！');
            }
        }
    </script>
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
                <h1><i class="fa fa-edit"></i>新增学生信息</h1>
                <p>请输入学生信息，确认无误后点击提交</p>
            </div>
            <div>
                <ul class="breadcrumb">
                    <li><a href="turnPage?page=index"><i class="fa fa-home fa-lg"></i></a></li>
                    <li class="active"><a href="#">信息添加</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="well bs-component">
                                <fieldset>
                                    <legend>新增学生数据</legend>
                                    <form class="form-horizontal" action="/adminInsertStudent" method="post">
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">学号</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="sstudentnumber" class="form-control inputxt"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">姓名</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="sname" class="form-control inputxt"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">性别</label>
                                            <div class="col-lg-10">
                                                <div class="radio">
                                                    <label>
                                                        <div class="sex1"><input id="optionsRadios1" type="radio" name="ssex" value="男" checked="">男</div>
                                                        <div class="sex2"><input id="optionsRadios2" type="radio" name="ssex" value="女">女</div>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">政治面貌</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="szhengzhi" class="form-control inputxt"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">身份证号</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="sidnumber" class="form-control inputxt"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">出生年月</label>
                                            <div class="col-lg-10">
                                                <select class="form-control" id="select" name="sbirthday">
                                                    <option selected="selected" disabled="disabled"  style='display: none' value=''></option>
                                                    <option value="20050505">20050505</option>
                                                    <option value="20060606">20060606</option>
                                                    <option value="20070707">20070707</option>
                                                    <option value="20080808">20080808</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Email</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="semail" class="form-control inputxt"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">QQ</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="sqq" class="form-control inputxt"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">个人电话</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="stel" class="form-control inputxt"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">家长电话</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="stelparent" class="form-control inputxt"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">家庭住址</label>
                                            <div class="col-lg-10">
                                                <input type="text" name="saddress" class="form-control inputxt"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label"></label>
                                            <div class="col-lg-10 btn-container">
                                                <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>提交</button>
                                            </div>

                                        </div>

                                    </form>
                                </fieldset>
                            </div>
                        </div>
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
</body>
</html>