package com.atguigu.crud.service;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.DepartmentExample;
import com.atguigu.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;


public List<Department> getDeparts(){
    List<Department> departments = departmentMapper.selectByExample(null);
    return departments;
}
}


