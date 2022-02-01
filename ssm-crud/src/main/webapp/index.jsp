<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%--<jsp:forward page="/emps?pn=3"></jsp:forward>--%>
<% pageContext.setAttribute("APP_PATH","http://localhost:8080/ssm_crud_war_exploded");  %>



<head>
<%--    <title>Title</title>--%>
<%--&lt;%&ndash;    引入jquery&ndash;%&gt;--%>
    <script type="text/javascript"  src="static/js/jquery-1.7.2.js"></script>
<%--    引入样式--%>
    <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>


</head>
<body>
<div style="margin-top: 200px;background-color: #3c3c3c;height: 300px;width: 300px;margin-left: 300px">

    <a href="http://localhost:8080/ssm_crud_war_exploded/emps" >只支持浏览器到服务端</a><br/><br/><br/><br/><br/><br/>
    <a href="http://localhost:8080/ssm_crud_war_exploded/emps_json" >Json版</a><br/><br/><br/>
    <a href="http://localhost:8080/ssm_crud_war_exploded/index_json">跳转到index_json页面</a>

</div>


</body>
</html>
