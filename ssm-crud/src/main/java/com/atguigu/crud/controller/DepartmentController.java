package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("/checkdept")
    @ResponseBody
   public Msg getDepts(){
       List<Department> departs = departmentService.getDeparts();
       Msg msg = new Msg();

       Msg all = msg.add("all", departs);
       return all;

   }
    @RequestMapping("/getdepts")
    @ResponseBody
   public Msg getdeptName(){
        List<Department> departs = departmentService.getDeparts();

        Msg msg = new Msg();
        Msg all = msg.success().add("all", departs);
        return all;
    }
}
