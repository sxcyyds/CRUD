package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    /**
     * 处理员工的crud
     * @return
     */

    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){
        //引入PageHelper分页插件
//        在查询之前只需要调用,传入页码以及分页的大小
        PageHelper.startPage(pn,5);
//        startPager紧跟的查询就是分页查询
        List<Employee> all = employeeService.getAlL(null);
//        使用pageinfo包装查询后的数据，只需要将PageInfo交给页面
//        封装了详细的分页信息，包括有查询的数据,连续显示5页
        PageInfo page = new PageInfo(all,5);
        model.addAttribute("pageInfo",page);


        return "list";
    }


    @RequestMapping("/emps_json")
    @ResponseBody
    public Msg getEmpsJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //引入PageHelper分页插件
//        在查询之前只需要调用,传入页码以及分页的大小
        PageHelper.startPage(pn,5);
//        startPager紧跟的查询就是分页查询
        List<Employee> all = employeeService.getAlL(null);
//        使用pageinfo包装查询后的数据，只需要将PageInfo交给页面
//        封装了详细的分页信息，包括有查询的数据,连续显示5页
        PageInfo page = new PageInfo(all,5);
        Msg pageinfo = Msg.success().add("pageinfo", page);
        return pageinfo;
    }

//跳转到index_json.jsp页面
    @RequestMapping("/index_json")
    public String index_json(){
        return "index-json";
    }



    @RequestMapping(value = "/saveemp",method = RequestMethod.POST)
    @ResponseBody
//   保存添加的数据
    public Msg saveEmp(Employee employee){
        int i = employeeService.saveEmp(employee);
        if(i!=0){
            new Msg().success();
        }
         return new Msg().fail();


    }
    @RequestMapping(value = "/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam("empName") String empName){
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success().add("all","true");
        }else{
            return Msg.fail().add("all","false");
        }
    }

    @RequestMapping(value = "/getEmp")
    @ResponseBody
    public Msg getEmpById(@RequestParam("id") Integer id){
        Employee empById = employeeService.getEmpById(id);
        return Msg.success().add("all",empById);
    }

    @RequestMapping(value ="/saveemp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg Update(Employee employee){
        System.out.println(employee);
        int i = employeeService.updateEmp(employee);
        if(i==0){
            return Msg.fail();
        }else {
            return Msg.success();
        }


    }










}


