<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/22
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <link href="dtree.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="dtree.js"></script>
</head>

<body bgColor=#DDF0FB leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<table width="90%" border="0" cellspacing="1" cellpadding="2" align="center">
    <div class="dtree">
        <script type="text/javascript">
            d=new dTree('d');

            d.add('01','-1','员工管理系统');
            d.add('0101','01','人力资源部');
            d.add('010101','0101','部门管理','department_findAll.action','','right');

            d.add('010102','0101','员工管理','employee_findAll.action','','right');
            document.write(d);
        </script>
    </div>
</table>

</body>
</html>

