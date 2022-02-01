<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.atguigu.crud.bean.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>员工列表</title>

<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
</head>
<%--    引入jquery--%>
<script type="text/javascript"  src="${APP_PATH}/static/js/jquery-1.7.2.js"></script>
<%--    引入样式--%>
<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
<script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>



<%-- web路径
不以  / 开始的相对路径，找资源，以当前的路径为基准，经常出现问题
以  /  开始的相对资源，找资源，以服务器的路径为基准（http://localhost:3306）需要加上项目名
        http://localhost:3306/crud


--%>






<body>

<%--搭建显示页面--%>
<div class="container">
<%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM【只适合浏览器---->服务端访问】</h1>
        </div>

    </div>





<%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
            <button class="btn btn-danger">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</button>
        </div>
    </div>



<%--    显示数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptId</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">

                    <tr>

                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M"?"男":"女"}</th>
                        <th>${emp.email}</th>

                        <th>${emp.department.deptId}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil">   添加</span>
                            </button>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-trash">   删除</span>
                            </button>
                        </th>
                    </tr>

                </c:forEach>






            </table>


        </div>




    </div>
<%--    显示分页信息--%>
    <div class="row">
<%--        分页文字信息--%>
        <div class="col-md-6">
            当前第【${pageInfo.pageNum}】页，总页码为【${pageInfo.pages}】,总记录数为【${pageInfo.total}】


        </div>
<%--            分页条信息--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>   <a href="${APP_PATH}/emps?pn=1" >首页</a> </li>
                    <li>
                        <c:if test="${pageInfo.pageNum>3}">
                            <a href="${APP_PATH}/emps/?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </c:if>

                    </li>









                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum ==pageInfo.pageNum}">
                            <li class="active"><a href="${APP_PATH}/emps?pn=${pageNum}" >${pageNum}</a></li>
                        </c:if>
                      <c:if test="${pageNum !=pageInfo.pageNum}">
                          <li> <a href="${APP_PATH}/emps?pn=${pageNum}" >${pageNum}</a></li>
                      </c:if>

                    </c:forEach>











                    <li>
                        <c:if test="${pageInfo.pageNum<=pageInfo.pages-3}">

                        <a href="${APP_PATH}/emps/?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>

                        </c:if>

                    </li>

                    <li>
                        <a href="${APP_PATH}/emps?pn=${pageInfo.pages}" >尾页</a>

                    </li>

                </ul>
            </nav>

        </div>




    </div>




</div>

</body>
</html>
