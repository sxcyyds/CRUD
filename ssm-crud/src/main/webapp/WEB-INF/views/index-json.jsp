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
<script type="text/javascript"  src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<%--    引入样式--%>
<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>





<%-- web路径
不以  / 开始的相对路径，找资源，以当前的路径为基准，经常出现问题
以  /  开始的相对资源，找资源，以服务器的路径为基准（http://localhost:3306）需要加上项目名
        http://localhost:3306/crud


--%>






<body>
<%--员工修改的模态框--%>
<div class="modal fade" id="emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>

            <div class="modal-body">
                <form>

                    <%--                模态框数据主体开始--%>
                    <div class="form-group">

                        <%--                    empName文本框--%>
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="emp_update_Name" placeholder="empName">
                            <span class="help-block"></span>
                        </div>

                    </div><br/><br/><br/>
                    <div class="form-group">
                        <%--                    email文本框--%>
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="emp_update_email" placeholder="email">
                            <span  class="help-block"></span>
                        </div>
                    </div><br/><br/><br/>

                    <div class="form-group">
                        <%--                    性别的单选--%>
                        <label  class="col-sm-2 control-label">gender</label>
                        <label class="radio-inline">

                            <input type="radio" name="gender"  id="gender1_update_input"  value="M" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                        </label>
                        <div class="col-sm-10">

                        </div>
                    </div><br/>



                    <%--    所属部门的下拉选项--%>
                    <div class="form-group">

                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="select_update" name="dId">

                            </select>

                        </div>
                    </div><br/><br/><br/>








                    <%--                模态框数据主体结束--%>



            </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_update_input">保存</button>
            </div>

        </div>
    </div>

</div>

<%--添加模块的modal--%>
<div class="modal fade" id="emp_add_input" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>

            <div class="modal-body">
                <form>

<%--                模态框数据主体开始--%>
                <div class="form-group">

<%--                    empName文本框--%>
                    <label  class="col-sm-2 control-label">empName</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="empName" id="empName" placeholder="empName">
                        <span class="help-block"></span>
                    </div>

                </div><br/><br/><br/>
                <div class="form-group">
<%--                    email文本框--%>
                    <label  class="col-sm-2 control-label">email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email" id="email" placeholder="email">
                        <span  class="help-block"></span>
                    </div>
                </div><br/><br/><br/>

                <div class="form-group">
                    <%--                    性别的单选--%>
                    <label  class="col-sm-2 control-label">gender</label>
                        <label class="radio-inline">

                            <input type="radio" name="gender"  id="gender1_add_input"  value="M" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                        </label>
                    <div class="col-sm-10">

                    </div>
                </div><br/>



<%--    所属部门的下拉选项--%>
                <div class="form-group">

                    <label  class="col-sm-2 control-label">empName</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="select" name="dId">

                        </select>

                    </div>
                </div><br/><br/><br/>








<%--                模态框数据主体结束--%>



            </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_add_input">保存</button>
            </div>

        </div>
    </div>

</div>





<%--搭建显示页面--%>
<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM【完全json和ajax开发】</h1>
        </div>

    </div>





    <%--    按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
                <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
            </div>
        </div>


    <%--    显示数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"/></th>
                        <th>#</th>
                        <th>empId</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>did</th>
                        <th>deptId</th>
                        <th>deptName</th>
                        <th>操作</th>

                    </tr>
                </thead>
                <tbody>

                </tbody>







            </table>


        </div>




    </div>
    <%--    显示分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6" id="page_info_area">



        </div>
        <%--            分页条信息--%>
        <div class="col-md-6" id="page_nav_area">


        </div>




    </div>




</div>
<script type="text/javascript">

<%--    总记录数--%>
var totaltiao;
<%--
    1、页面加载完成后，直接去发送一个ajax请求，要到分页数据
--%>
    $(function () {
        to_page(1)



    })

function to_page(pn){
    //总页数

    $.ajax({
        url:"${APP_PATH}/emps_json",
        data:"pn="+pn,
        type:"get",
        success:function (result) {
            totaltiao=result.extend.pageinfo.pages
            // console.log(result);
            //   1、 解析并显示员工数据
            build_emps_table(result);

            //    2、解析并显示分页数据
            build_page_info(result);
            //    3、解析并显示分页数据条
            build_page_nav(result);


        }
    })

}

    function build_emps_table(result){
        //为防止每次的数据都包含上次的数据，每次都需要将数据清空
        $("#emps_table tbody").empty()
        var emps = result.extend.pageinfo.list;
        $.each(emps,function (index,item) {
            var empIdTd=$("<td></td>").append(item.empId);
            var empnameTd=$("<td></td>").append(item.empName);
            var checkboxTd=$("<td><input type='checkbox' class='check_item'/></td>")


            var genderTd=$("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd=$("<td></td>").append(item.email);

            var didTd=$("<td></td>").append(item.dId);
            var deptidTd=$("<td></td>").append(item.department.deptId);
            var deptNameTd=$("<td></td>").append(item.department.deptName);

            var eidbtnTd=$("<button>  编辑</button>").addClass("btn btn-primary btn-ssm edit_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil")
            var delbtnTd=$("<button>  删除</button>").addClass("btn btn-danger btn-ssm")
                .append("<span></span>").addClass("glyphicon glyphicon-trash")
            var btnTd=$("<td></td>").append(eidbtnTd).append(delbtnTd)
            eidbtnTd.attr("edit-id",item.empId)



            $("<tr></tr>").append(checkboxTd)
                .append(empIdTd)
                .append(empnameTd)
                .append(genderTd)
                .append(emailTd)
                .append(didTd)



                .append(deptidTd)
                .append(deptNameTd)



                .append(btnTd)




                .appendTo("#emps_table tbody")


        })


    }
//    解析显示分页信息
function build_page_info(result) {
    $("#page_info_area").empty()
        $("#page_info_area")
            .append("  当前第【"+result.extend.pageinfo.pageNum+"】页，" +
                "总页码为【"+result.extend.pageinfo.pages+"】" +
                ",总记录数为【"+result.extend.pageinfo.total+"】")


}




//解析显示分页条
    function build_page_nav(result) {

        $("#page_nav_area").empty();
        //构建元素
        var ul=$("<ul></ul>").addClass("pagination")
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var perPageLi=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));


        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));


        var lastPageLi=$("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        ul.append(firstPageLi).append(perPageLi)
        if(result.extend.pageinfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled")
            perPageLi.addClass("disabled")
        }else{
            //为元素添加点击事件
            firstPageLi.click(function () {to_page(1) });
            perPageLi.click(function () {
                to_page(result.extend.pageinfo.pageNum-1)

            })

        }



        $.each(result.extend.pageinfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if(result.extend.pageinfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item)


            })
            ul.append(numLi);


        })

        ul.append(nextPageLi).append(lastPageLi)
        if(result.extend.pageinfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            //添加点击事件
            nextPageLi.click(function () {to_page(result.extend.pageinfo.pageNum+1) })
            lastPageLi.click(function () {to_page(result.extend.pageinfo.pages)})


        }


        var nav=$("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");


    }



//新增按钮绑定单击事件,modal弹出
    $("#emp_add_modal_btn").click(function () {
        //清除原来的表单数据（表单重置）
        $("#myModalLabel form")[0].reset();
        $("#emp_add_input").modal({backdrop:"static"})

    });
//    查询出部门的信息显示在modal中的下拉框中
    $("#emp_add_modal_btn").click(function () {
        $.ajax({
            url:"${APP_PATH}/checkdept",
            type: "GET",
            data:"",
            success:function (result) {
                console.log();
                crdept(result);


            }
        })

    });
//    向modal中添加查询的数据
    function crdept(result) {
        var a=result.extend.all
        $.each(a,function (index,item) {
            $("<option><option>").append(item.deptName).attr("value",item.deptId).appendTo("#select");


        })

    }

//    单击保存按钮,保存提交的数据

    $("#save_add_input").click(function () {
        //获取ajax校验的用户名是否可用，不可用就禁用保存按钮

        //调用jquery前端校验方法
        if(!check()){
            return false;
        }
        if($("#this").attr("ajax-va")=="error"){
            return false;


        }
        $.ajax({
            url:"${APP_PATH}/saveemp",
            type:"post",
            data:$("#emp_add_input form").serialize(),
            success:function (result) {
                $("#emp_add_input").modal("hide")
                to_page(totaltiao)

            }
        })








    });
//    jquery前端校验
    function check() {
        var name=$("#empName").val();

        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(name)){

            show_check("#empName", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }else{
            show_check("#empName", "success", "");
        };


        var email=$("#email").val();
        var regemail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regemail.test(email)){
            show_check("#email","error","格式错误");
            return false;


        }else {
            show_check("#email","success","");



        }
        return true;



    }
//    校验的代码抽取
    function show_check(ele,stats,msg){
        if("success"==stats){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg)


        }else if("error"==stats){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg)
            return false;
        }
    }
//    校验用户名是否可用
    $("#empName").change(function () {
        $.ajax({
            url:"${APP_PATH}/checkUser",
            type:"GET",
            data:"empName="+$("#empName").val(),
            success:function (result) {
                console.log(result)
                alert(result.code)
                if(result.code==200){
                    show_check("#empName","error","用户名不可用");
                    $("#save_add_input").attr("aiax-va","erro");

                }else{
                    show_check("#empName","success","用户名可用");
                    $("#save_add_input").attr("ajax-va","success")

                }


            }
        });

    });



//    更新按钮
    $(document).on("click",".edit_btn",function () {
        //查出部门信息，并显示部门列表
        //查出员工信息，并显示
        $("#emp_update_modal").modal({
            backdrop: "static"
        })
        alert($(this).attr("edit-id"))
        getEmp($(this).attr("edit-id"))
        //将id只传递给保存按钮
        $("#update_update_input").attr("edit_id",$(this).attr("edit-id"))
        getDepts();


    })
    function  getDepts() {
        $.ajax({
            url:"${APP_PATH}/getdepts",
            type:"GET",
            data:"null",
            success:function (result) {
                console.log()
                var a=result.extend.all;
                $.each(a,function (index,item) {
                    $("<option></option>").append(item.deptName).attr("value",item.deptId).appendTo("#select_update");
                })
            }
        });
    }
    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/getEmp",
            type:"GET",
            data:"id="+id,
            success:function (result) {
                var edit_up=result.extend.all;
                alert(edit_up.empName)
                $("#emp_update_Name").val(edit_up.empName);
                $("#emp_update_email").val(edit_up.email);
                $("#emp_update_modal input[name=gender]").val([edit_up.gender]);
                $("#emp_update_modal select").val([edit_up.dId]);

                console.log()

            }
        })
    }
    $("#update_update_input").click(function () {
        <%--alert(" ${APP_PATH}/saveemp/"+$(this).attr("edit_id"))--%>
        $.ajax({
            url:" ${APP_PATH}/saveemp/"+$(this).attr("edit_id"),
            type:"PUT",
            data:$("#emp_update_modal form").serialize(),
            success:function (result) {
                // alert(result.msg);
                to_page(totaltiao)

            }
        })

    });

//全选&全不选
    $("#check_all").click(function () {
        alert($(this).prop("checked"))
        $(".check_item").prop("checked",$(this).prop("checked"))

    });
    $(document).on("click",".check_item",function () {
        // alert($(".check_item:checked").length)
        var flg=$(".check_item:checked").length==$(".check_item").length
        $("#check_all").prop("checked",flg)


    })
    var empNames="";
    $("#emp_delete_all_btn").click(function () {
        $.each($(".check_item:checked"),function () {
           var aa= $(this).parents("tr").find("td:eq(2)").text()+",";
           empNames+=aa;


        })
        //删除最后的，
        empNames=empNames.substring(0,empNames.length-1)
        if(confirm("确认删除【"+empNames+"】吗？")){
        //    发送ajax请求删除信息

        }






    })






</script>

</body>
</html>
