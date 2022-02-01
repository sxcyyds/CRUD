package com.atguigu.crud.service;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.DepartmentExample;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import java.util.*;

@Component
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工
     * @return
     */

    public List<Employee> getAlL(Model model){
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        return employees;

    }
    public int saveEmp(Employee employee){
        int insert = employeeMapper.insert(employee);
        return insert;

    }
    public boolean checkUser(String name){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(name);
        long l = employeeMapper.countByExample(employeeExample);
        return l==0;
    }

    public Employee getEmpById(Integer id){
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public int updateEmp(Employee employee){
        int i = employeeMapper.updateByPrimaryKeySelective(employee);
        return i;

    }






}
