package com.atguigu.crud.test;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.AbstractQueue;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:Spring.xml"})
public class MYTest2 {


//    @Autowired
//    DepartmentMapper departmentMapper;
    /**
     * 基于xml配置文件
     */
    @Test
    public void testCRUD(){
//        1、创建spring的ioc容器
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Spring.xml");
//        2、从容器中获取对象
        DepartmentMapper bean = context.getBean(DepartmentMapper.class);
//        3、插入部门
        Department department = new Department(null, "single");
        bean.insertSelective(department);



    }
    /**
     * 完全基于注解
     * 1、导入Spring单元测试
     *  @ContextConfiguration  指定配置文件的位置
     *  2、指定单测试的模块
     */
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    //    批量插入数据
    @Autowired
    SqlSession sqlSession;
    @Test
    public void testAnno(){
//        Department department = new Department(null, "Research Department");
//        int i = departmentMapper.insertSelective(department);
//        if(i>0){
//            System.out.println("添加成功");
//        }
        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(2);
        System.out.println(employee);
//        Employee中  测试插入员工
        int i = employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "3193782853@qq.com", 1));
        System.out.println(i);


    }

    @Test
    public void testAddBath(){
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<150;i++){
            String uid = UUID.randomUUID().toString().substring(0, 5);
            mapper.insertSelective(new Employee(null,uid,"M",uid+"QQ.com",3));
        }

    }

    //        删除

    @Test
    public void delete(){
        int i = employeeMapper.deleteByPrimaryKey(25);
        System.out.println(i);

    }
//    改
    @Test
    public void updateTest(){
        int i = employeeMapper.updateByPrimaryKey(new Employee(23, "AAA", "W", "AAAqq.com", 2));
        System.out.println(i);

    }
//    查
    @Test
    public void testSelect(){
        List<Employee> employees = employeeMapper.selectByExample(new EmployeeExample());
        for (Employee e:employees) {
            System.out.println(e);
        }
    }

}
